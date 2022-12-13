# ----------------------------------------------------------------
# Created by    : Daniel Montiel
# Created date   : 22/ Nov / 2022
# -----------------------------------------------------------------
"""
    Library to parse pdbs and upload them into epitope analyzer daatabase.
"""

from prody import *
from pathlib import Path
import DatabaseConnection as db
import ConfigReader as conf
import getopt
import Debug_Control as debug
import sys
import pathlib

PDB_path = conf.config["GENERAL"]["PDB_path"]
User_path = conf.config["GENERAL"]["User_path"]
PDB_alignment_path = conf.config["GENERAL"]["PDB_alignment_path"]


class PDB_aa_db:

    def __init__(self, PDB):
        self.header = []
        self.atoms = []
        self.pdbCode = PDB
        self.output = []
        self.dt = db.connect()
        self.cur = self.dt.cursor()

    def parse_PDB(self, alignment = False):
        path = self.pdbCode
        if alignment:
            self.header = parsePDBHeader(PDB_alignment_path + self.pdbCode)
            self.atoms = parsePDB(PDB_alignment_path + self.pdbCode)
        else:
            self.atoms = parsePDB(path)
            self.header = parsePDBHeader(path)


    def setup_user_defined_PDB(self):
        self.header["identifier"] = Path(self.pdbCode).stem
        self.header["title"] = Path(self.pdbCode).stem
        self.header["classification"] = ""
        self.header["resolution"] = 0
        self.header["experiment"] = ""

    def upload_to_db(self):

        if self.header["identifier"] == "XXXX":
            self.setup_user_defined_PDB()
        else:
            print(self.header["identifier"])

        if self.exist_pdb(self.header["identifier"]) == 0:
            entry_key = self.process_header()
            if "polymers" in self.header:
                self.process_molecules(entry_key)
            if "biomoltrans" in self.header and len(self.header['biomoltrans']) > 0:
                self.process_matrices(entry_key)
            self.process_atoms(entry_key)
            self.dt.commit()
        else:
            print("PDB already exist")
        self.cur.close()
        self.dt.close()

    def exist_pdb(self, pdb):
        sql = "SELECT COUNT(*) FROM epitope_analyzer.PDB_Headers where Pdb = %(pdb)s"
        self.cur.execute(sql, {"pdb": pdb})
        recordCount = self.cur.fetchall()
        return recordCount[0][0]

    def process_header(self):
        sql = """INSERT INTO epitope_analyzer.PDB_Headers(Pdb,Name,Mol_Type,Resolution,Experiment) 
               VALUES (%s,%s,%s,%s,%s)"""
        #title = self.header["title"].replace('\'', '').replace(',', '')
        title = self.header["title"]
        data = (self.header["identifier"], title,
               self.header["classification"],
               float(self.header["resolution"]), self.header["experiment"])
        try:
            self.cur.execute(sql, data)
        except Exception as exp:
            print(exp)
            print(sql % data)
        return self.cur.lastrowid

    def process_molecules(self, entry_key):
        mol_id = 1
        for chain in self.header["polymers"]:
            sql = """INSERT INTO epitope_analyzer.PDB_Mol_Info (Pdb, Mol_Id, Chain, Mol_Name, entry_key, Sequence) \
                     VALUES (%s,%s,%s,%s,%s,%s)"""
            data = (self.header["identifier"], mol_id,
                    chain.chid, chain.name.replace('\'', ''), entry_key,
                    chain.sequence)
            self.cur.execute(sql, data)
            mol_id += 1

    def process_matrices(self, entry_key):
        mtid = 1
        mtnum = 0
        strmt = ""
        for mol in self.header["biomoltrans"]['1']:
            # print(mol)
            if (mtnum == 3):
                strmt += mol
                arry = strmt.replace('\n', '').split(' ')
                arry = [i for i in arry if i]
                sql = "INSERT INTO epitope_analyzer.PDB_BioMT VALUES ("
                sql += "'{}',{},{},{:.3f},{:.3f},{:.3f},{:.3f},{:.3f},{:.3f},{:.3f},{:.3f},{:.3f},{:.3f},{:.3f},{:.3f}); ".format(
                    self.header["identifier"], mtid, entry_key,
                    float(arry[0]), float(arry[1]), float(arry[2]),
                    float(arry[4]), float(arry[5]), float(arry[6]),
                    float(arry[8]), float(arry[9]), float(arry[10]),
                    float(arry[3]), float(arry[7]), float(arry[11]))
                self.cur.execute(sql)
                strmt = ""
                mtnum = -1
                mtid += 1
            else:
                if type(mol) == str:
                    strmt += mol

            mtnum += 1

    def process_atoms(self, entry_key):
        atomnum = 1
        for atom in self.atoms:
            sql = """ INSERT INTO epitope_analyzer.PDB_ATOM 
             (atom_site_key ,entry_key, pdb, label_atom_id, label_seq_id,
             label_comp_id, label_asym_id, cartn_x, cartn_y,
             cartn_z, occupancy, b_iso_or_equiv) 
             VALUES (%s,%s,%s,%s,%s,%s,%s, %s,%s,%s,%s,%s)"""

            data = (atomnum, entry_key, self.header["identifier"], atom.getName().replace('\'', ''), int(atom.getResnum()),
                str(atom.getResname()), str(atom.getChid()), float(atom.getCoords()[0]), float(atom.getCoords()[1]),
                float(atom.getCoords()[2]), float(atom.getOccupancy()), float(atom.getBeta()))
            #print(sql % data)
            self.cur.execute(sql, data)
            atomnum += 1

    def save_pdb(self, atoms_to_save):
        writePDB(self.output, atoms_to_save)


def arguments_parsing():
    global PDB_path
    OPTIONS = {}
    if len(sys.argv) > 1:
        debug.print_info(f"pdb parse:{sys.argv[1:]}")
        try:
            opts, args = getopt.getopt(sys.argv[1:], "", ["pdb=", "input_path=", "output_path=" ])
        except getopt.GetoptError as err:
            debug.print_error(f"Parameters error {err}")
            exit(2)

        for opt, arg in opts:
            if opt == "--pdb":
                OPTIONS["PDB"] = arg
            elif opt == "--input_path":
                OPTIONS["input_path"] = arg
                PDB_path = arg
            elif opt == "--output_path":
                OPTIONS["output_path"] = arg

        debug.change_config()
        return OPTIONS
    else:
        print("Parameters missing using defaults from [config.ini]")
        print(" --pdb Init pdb structure")
        print(" --input_path Upload all pdbs in a folder")
        exit(2)
    print("Wait")


def upload_all_pdbs_folder(folder_path):
    pdb_path = pathlib.Path(folder_path)
    for pdb in pdb_path.glob("*.pdb"):
        pdb_db = PDB_aa_db(str(pdb))
        pdb_db.parse_PDB()
        pdb_db.upload_to_db()

# Program to read and parse a pdb file and upload it to a MysqlDatabase
# Params: --pdb pdbfile_name

if __name__ == "__main__":
    arguments = arguments_parsing()
    if 'PDB' in arguments:
        pdb_controller = PDB_aa_db(arguments["PDB"])
        pdb_controller.parse_PDB()
        pdb_controller.upload_to_db()
    elif 'input_path' in arguments:
        upload_all_pdbs_folder(arguments["input_path"])


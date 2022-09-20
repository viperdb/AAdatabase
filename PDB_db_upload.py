from prody import *
from pathlib import Path
import DatabaseConnection as db
import ConfigReader as conf
import getopt
import Debug_Control as debug
import sys

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
        #self.pdbCode = pdb
        #path = PDB_path + self.pdbCode
        path = self.pdbCode
        if alignment:
            self.header = parsePDBHeader(PDB_alignment_path + self.pdbCode)
            self.atoms = parsePDB(PDB_alignment_path + self.pdbCode)
        else:
            self.atoms = parsePDB(path)
            self.header = parsePDBHeader(path)

        #print("Parse completed")

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
            #print("{} uploaded successfully".format(self.header["identifier"]))
        else:
            print("PDB already exist")
        self.cur.close()
        self.dt.close()

    def exist_pdb(self, pdb):
        sql = "SELECT COUNT(*) FROM epitope_analyzer.PDB_Headers where Pdb = '{}'".format(pdb)
        self.cur.execute(sql)
        recordCount = self.cur.fetchall()
        return recordCount[0][0]

    def process_header(self):
        sql = "INSERT INTO epitope_analyzer.PDB_Headers(Pdb,Name,Mol_Type,Resolution,Experiment) "
        sql += "VALUES ('{}','{}','{}',{},'{}')".format(self.header["identifier"], self.header["title"],
                                                        self.header["classification"],
                                                        self.header["resolution"], self.header["experiment"])
        self.cur.execute(sql)
        return self.cur.lastrowid

    def process_molecules(self, entry_key):
        mol_id = 1
        for chain in self.header["polymers"]:
            sql = "INSERT INTO epitope_analyzer.PDB_Mol_Info (Pdb, Mol_Id, Chain, Mol_Name, entry_key, Sequence)"
            sql += "VALUES ('{}',{},'{}','{}',{},'{}')".format(self.header["identifier"], mol_id,
                                                               chain.chid, chain.name.replace('\'', ''), entry_key,
                                                               chain.sequence)
            self.cur.execute(sql)
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
            sql = "INSERT INTO epitope_analyzer.PDB_ATOM "
            sql += "(atom_site_key ,entry_key, pdb, label_atom_id, label_seq_id,"
            sql += "label_comp_id, label_asym_id, cartn_x, cartn_y,"
            sql += "cartn_z, occupancy, b_iso_or_equiv) "
            sql += "VALUES ({},{},'{}','{}','{}','{}','{}',{:.3f},{:.3f},{:.3f},{},{})".format(
                atomnum, entry_key, self.header["identifier"], atom.getName().replace('\'', ''), atom.getResnum(),
                atom.getResname(), atom.getChid(), atom.getCoords()[0], atom.getCoords()[1],
                atom.getCoords()[2], atom.getOccupancy(), atom.getBeta())
            # print(sql)
            self.cur.execute(sql)
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
        exit(2)
    print("Wait")


# Program to read and parse a pdb file and upload it to a MysqlDatabase
# Params: --pdb pdbfile_name

if __name__ == "__main__":
    arguments = arguments_parsing()
    pdb_controller = PDB_aa_db(arguments["PDB"])
    pdb_controller.parse_PDB()
    pdb_controller.upload_to_db()
    pass
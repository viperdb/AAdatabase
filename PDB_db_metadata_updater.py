import Pdb_parser
import DatabaseConnection as db
import pathlib

def find_molecule(pdb_id, mol_name, chain):
    #sql = """ SELECT Mol_Id, entry_key, Chain, Pdb , Mol_Name   FROM epitope_analyzer.PDB_Mol_Info
    #         WHERE Pdb = %s and Mol_name = %s and Chain = %s; """

    #Problems with the chain name, try failed entries without chain name constrain
    sql = """ SELECT Mol_Id, entry_key, Chain, Pdb , Mol_Name   FROM epitope_analyzer.PDB_Mol_Info 
                 WHERE Pdb = %s and Chain = %s; """
    dt = db.connect()
    cur = dt.cursor()
    cur.execute(sql, (pdb_id, chain))
    data = cur.fetchall()
    cur.close()
    dt.close()

    record_number = len(data)

    if record_number == 1:
        return data[0]
    elif record_number == 0:
        print("Record not found:")
        print(sql%(pdb_id, mol_name, chain))
        return data
    else:
        return data

def build_update_record(m_compnd, m_source, m_db):
    data = (get_record(m_source,'ORGANISM_SCIENTIFIC'),
            get_record(m_source,'ORGANISM_TAXID'),
            get_record(m_source,'STRAIN'),
            get_record(m_source,'ORGAN'),
            get_record(m_source, 'TISSUE'),
            get_record(m_source, 'MOL_ID'),
            get_record(m_source, 'ORGANISM_COMMON'),
            get_record(m_compnd, 'SYNONYM'),
            get_record(m_compnd, 'FRAGMENT'),
            m_db[0],
            m_db[1],
            m_db[2])
    return data

def execute_update(data):
    sql = """ UPDATE epitope_analyzer.PDB_Mol_Info SET 
                    Organism_Scientific= %s,
                    Organism_TaxID = %s,
                    Strain = %s,
                    Organ = %s,
                    Tissue = %s,
                    PDB_Mol_Id = %s,
                    Organism_common = %s,
                    Synonym = %s,
                    Fragment = %s
                    WHERE Mol_Id = %s and entry_key = %s and Chain = %s;
                    """
    dt = db.connect()
    cur = dt.cursor()
    #cur.executemany(sql, data)
    for d in data:
        cur.execute(sql, params=d)
        #print(cur.statement)
    dt.commit()
    print(f"Number of affected rows {cur.rowcount}")
    cur.close()
    dt.close()



def get_record(data,key):
    if key in data.keys():
        return data[key]
    return ''

def get_source_by_molID (mol_id, source):
    for mol in source:
        if mol['MOL_ID'] == mol_id:
            return mol
    return ''

def update_source_metadata (pdb):
    parser= Pdb_parser.CustomPdbParser()
    parser.parse(pdb)
    source = parser.source
    header = parser.header
    compond = parser.compnd

    data_update = []
    print(header['idCode'])
    for mol in compond:
        print(mol)
        for mol_chain in mol['CHAIN']:
            data = find_molecule(header['idCode'], mol['MOLECULE'], mol_chain.strip())
            sdata = get_source_by_molID(mol['MOL_ID'],source)
            data_update.append( build_update_record(mol,sdata,data))
    execute_update(data_update)


def batch_upload(content):
    strOutput = ""
    for file in content:
        print(file)
        strOutput += str(file)
        try:
            update_source_metadata(file)
            strOutput += "    OK \n"
        except Exception as err:
            print(err)
            strOutput += "    Fail \n"
            strOutput += str(err)
            strOutput += "\n"
    with open("log_update.log", 'w') as f1:
        f1.write(strOutput)

if __name__ == "__main__":

    #Single pdb upload
    #___________________________________________________________________
    update_source_metadata("/home/dante/PDB_antibody/pdb5hyf.pdb")
    exit()

    #Code used when the source comes from the files in a folder
    # ___________________________________________________________________
    #path = "/home/dante/PDB_antibody/"
    #obj_path = pathlib.Path(path)
    #batch_upload(obj_path.glob('*.pdb'))

    #Code used to process the entries when comes from a file
    # ___________________________________________________________________
    #file_source_path="fail_log_update_v2.log"
    #pdb_paths = []
    #with open(file_source_path) as f:
    #    pdb_lines = f.readlines()
    #for line in pdb_lines:
    #    str_file_name = line.split(' ')[0]
    #    pdb_paths.append(pathlib.Path(str_file_name))

    #batch_upload(pdb_paths)
    #print(pdb_paths)



    #update_source_metadata("/home/dante/PDB_antibody/pdb5xs5.pdb")
    #update_source_metadata("/home/dante/PDB_antibody/pdb6et5.pdb")
    #data = find_molecule('5xs7', 'LIGHT CHAIN OF FAB 1D5')
    #print(data)
import re
from KalignData import KalignData


class KmultiParse:

    def __init__(self, str_file_content=""):
        self.str_kpair = str_file_content
        self.file_path = ""
        self.kalign_data = KalignData()
        pass

    def load_file(self, path):
        self.file_path = path
        with open(path) as f:
            self.str_kpair = f.read()

    def get_num_structures(self):
        pattern = f"#Structures:( )*(?P<structures>\d+)"
        content = re.search(pattern, self.str_kpair)
        return content.group("structures")

    def get_columns(self):
        pattern = f"#Columns:( )*(?P<columns>\d+)"
        content = re.search(pattern, self.str_kpair)
        return content.group("columns")

    def get_columns(self):
        pattern = f"#Columns:( )*(?P<columns>\d+)"
        content = re.search(pattern, self.str_kpair)
        return content.group("columns")

    def get_residues(self):
        pattern = f"#Residues:( )*(?P<residues>\d+)"
        content = re.search(pattern, self.str_kpair)
        return content.group("residues")

    def get_longest(self):
        pattern = f"#Longest:( )*(?P<longest>\d+)"
        content = re.search(pattern, self.str_kpair)
        return content.group("longest")

    def get_shortest(self):
        pattern = f"#Shortest:( )*(?P<shortest>\d+)"
        content = re.search(pattern, self.str_kpair)
        return content.group("shortest")

    def get_mscore(self):
        pattern = f"#Mscore:( )*(?P<mscore>\d+.\d*)"
        content = re.search(pattern, self.str_kpair)
        return content.group("mscore")

    def get_strucure_names(self):
        pattern = f"#Name:[ ]*(?P<strnum>\d+)[ ]+(?P<strname>\S+)[ ]+(?P<strfile>\S+)"
        content = re.findall(pattern, self.str_kpair)
        return content

    def get_structure_names_files(self):
        pdb_ids = []
        pdb_files= []
        arrData = self.get_strucure_names()

        for data in arrData:
            pdb_files.append(data[2])
            if  data[1][4] == '_':
                pdbid_chain = data[1].split('_')
                pdb_ids.append({"pdb_id":pdbid_chain[0], "chain":pdbid_chain[1]})
            else:
                pdb_ids.append({"pdb_id": data[1]})
        return pdb_ids, pdb_files

    def get_alignment(self):
        pattern = r"[ ]*([A-Z]:\d:[A-Z]{3})"
        content = re.findall(pattern, self.str_kpair)
        return content

    def get_alignment2(self):
        alignment = []
        lines = self.str_kpair.split('\n')
        for line in lines:
            if "#" not in line:
                if len(line) > 5:
                    a_row =' '.join( line.split(' ')).split()
                    for i,aminoacid in enumerate(a_row):
                        a_row[i]= self.parse_aminoacid(aminoacid)
                    alignment.append(a_row)
        return alignment

    def parse_aminoacid(self, a_row):
        if a_row != '-':
            parts = a_row.split(':')
            try:
                return {'chain': parts[0], 'r_num': int(parts[1]), 'r_name': parts[2]}
            except ValueError:
                return {'chain': parts[0], 'r_num': int(parts[1][:-1]), 'r_name': parts[2]}
        else:
            return {'chain': '-', 'r_num': -1, 'r_name': '-'}

    def parse(self):
        pdbids, pdb_files = self.get_structure_names_files()

        self.kalign_data.pdb_files = pdb_files
        self.kalign_data.pdbs = pdbids
        self.kalign_data.num_structures = self.get_num_structures()
        self.kalign_data.columns = self.get_columns()
        self.kalign_data.residues = self.get_residues()
        self.kalign_data.longest = self.get_longest()
        self.kalign_data.shorest = self.get_shortest()
        self.kalign_data.mscore = self.get_mscore()
        self.kalign_data.align = self.get_alignment2()
        return self.kalign_data





class KalignData:

    def __init__(self):
        self.pdb_files = []
        self.pdbs =[]
        self.num_structures = 0
        self.columns = 0
        self.residues = 0
        self.longest = 0
        self.shorest = 0
        self.mscore = 0
        self.align =[]

    def get_chains(self, structure):
        chains = []
        for row in self.align:
            if row[structure]['chain'] not in chains:
                if row[structure]['chain'] != '-':
                    chains.append(row[structure]['chain'])
        return chains

    def get_align_index(self, structure_index, amino_num, chain ):
        for i, row in enumerate(self.align):
            if row[structure_index]['chain'] == chain and row[structure_index]['r_num'] == amino_num :
                return i
        return -1

    def get_pdb_index(self, pdb):
        for i, structure in enumerate(self.pdbs):
            if pdb == structure['pdb_id']:
                return i
        return -1

    def set_annotation(self, epitope, structure_index):
        #print(structure_index, epitope)
        ep_index = self.get_align_index(structure_index, epitope[0], epitope[3])
        self.align[ep_index][structure_index]['t_int'] = epitope[2]
        self.align[ep_index][structure_index]['dist'] = epitope[1]

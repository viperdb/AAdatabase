class AtomCompData:
    def __init__(self):
        self.pdb_name = ""
        self.atom1 = ""
        self.chain1 = ""
        self.resnum1 = ""
        self.resname1 = ""
        self.atom2 = ""
        self.chain2 = ""
        self.resnum2 = ""
        self.resname2 = ""
        self.distance = 0
        self.type_of_interaction = ""
        pass

    def __str__(self):
        return f"{self.distance:.3f} [{self.type_of_interaction}] " \
               f"{self.chain1}:{self.resnum1}.{self.atom1}-{self.chain2}:{self.resnum2}.{self.atom2}"

    def get_comp_name(self, part):
        if part == 1:
            return "{}_{}_{}".format(self.chain1, self.resname1, self.resnum1)
        else:
            return "{}_{}_{}".format(self.chain2, self.resname2, self.resnum2)

    def to_dictionary(self):
        return vars(self)

    def to_sql(self):
        table_name = "epitope_analyzer.PDB_Interactions"
        sql = f"INSERT INTO {table_name} " \
              f"VALUES ('{self.pdb_name}','{self.pdb_name}', '{self.chain1}','{self.chain2}','{self.atom1}'," \
              f"'{self.atom2}', '{self.resname1}','{self.resname2}',{self.resnum1},{self.resnum2},{self.distance:.2f}," \
              f"'{self.type_of_interaction}');"
        return sql
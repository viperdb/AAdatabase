import DatabaseConnection as db
import AtomCompData as acd


class Db_interactions:

    def upload_interactions(self, interactions):
        db1 = db.connect()
        cur = db1.cursor()

        for interction in interactions:
            try:
                cur.execute(interction.to_sql())
            except Exception as err:
                print(err)

        db1.commit()
        cur.close()
        db1.close()

    def get_interactions(self, pdb):
        sql = f"SELECT * FROM epitope_analyzer.PDB_Interactions WHERE PDB_1 = '{pdb}';"
        results = db.getDataFromAQuerry_descrip(sql)
        return self.from_db_to_obj(results[0])

    def get_interactions(self, pdb):
        sql = f"SELECT * FROM epitope_analyzer.PDB_Interactions WHERE PDB_1 = '{pdb}';"
        results = db.getDataFromAQuerry_descrip(sql)
        return self.from_db_to_obj(results[0])

    def get_antigen_interactions_by_chain(self, pdb, chain):
        sql = """SELECT pi.Amino_Num_1, min(pi.Distance) as distance, min(pi.Type_of_Interaction), min(Chain_1), 
                 min(PDB_1)   
                 FROM epitope_analyzer.PDB_Interactions  as pi 
                 WHERE PDB_1 = '{0}' and Chain_1 = '{1}' and Type_of_Interaction != 'None'
                 GROUP BY Amino_Num_1 order by Amino_Num_1;""".format(pdb, chain)
        results = db.getDataFromAQuerry_descrip(sql)
        return results[0]

    def from_db_to_obj(self, results):
        arr_results = []
        for row in results:
            interaction = acd.AtomCompData()
            interaction.pdb_name = row[0]
            interaction.chain1 = row[2]
            interaction.chain2 = row[3]
            interaction.atom1 = row[4]
            interaction.atom2 = row[5]
            interaction.resname1 = row[6]
            interaction.resname2 = row[7]
            interaction.resnum1 = row[8]
            interaction.resnum2 = row[9]
            interaction.distance = row[10]
            interaction.type_of_interaction = row[11]
            arr_results.append(interaction)
        return arr_results
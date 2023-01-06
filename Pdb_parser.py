
"""
This is a custom parser for the Source/compound records of the pdb files
SOURCE
Record Format

COLUMNS      DATA  TYPE     FIELD          DEFINITION
--------------------------------------------------------------------------------------
 1 -  6      Record name    "SOURCE"
 8 - 10      Continuation   continuation   Allows concatenation of multiple records.
11 - 79      Specification  srcName        Identifies the source of the
             List                          macromolecule in a  token: value format.

Details

TOKEN                                VALUE  DEFINITION
--------------------------------------------------------------------------------------
MOL_ID                               Numbers each  molecule. Same as appears in COMPND.
SYNTHETIC                            Indicates a  chemically-synthesized source.
FRAGMENT                             A domain or  fragment of the molecule may be
                                     specified.
ORGANISM_SCIENTIFIC                  Scientific name of the  organism.
ORGANISM_COMMON                      Common name of the  organism.
ORGANISM_TAXID                       NCBI Taxonomy ID number  of the organism.
STRAIN                               Identifies the  strain.
VARIANT                              Identifies the  variant.
CELL_LINE                            The specific line of  cells used in the experiment.
ATCC                                 American Type  Culture Collection tissue
                                     culture  number.
ORGAN                                Organized group of  tissues that carries on
                                     a specialized function.
TISSUE                               Organized group  of cells with a common
                                     function and  structure.
CELL                                 Identifies the  particular cell type.
ORGANELLE                            Organized structure  within a cell.
SECRETION                            Identifies the secretion, such as  saliva, urine,
                                     or venom,  from which the molecule was isolated.
CELLULAR_LOCATION                    Identifies the location  inside/outside the cell.
PLASMID                              Identifies the plasmid  containing the gene.
GENE                                 Identifies the  gene.
EXPRESSION_SYSTEM                    Scientific name of the organism in  which the
                                     molecule was expressed.
EXPRESSION_SYSTEM_COMMON             Common name of the organism in  which the molecule
                                     was  expressed.
EXPRESSION_SYSTEM_TAXID              NCBI Taxonomy ID of the organism  used as the
                                     expression  system.
EXPRESSION_SYSTEM_STRAIN             Strain of the organism in which  the molecule
                                     was  expressed.
EXPRESSION_SYSTEM_VARIANT            Variant of the organism used as the
                                     expression  system.
EXPRESSION_SYSTEM_CELL_LINE          The specific line of cells used as  the
                                     expression  system.
EXPRESSION_SYSTEM_ATCC_NUMBER        Identifies the ATCC number of the  expression system.
EXPRESSION_SYSTEM_ORGAN              Specific organ which expressed  the molecule.
EXPRESSION_SYSTEM_TISSUE             Specific tissue which expressed  the molecule.
EXPRESSION_SYSTEM_CELL               Specific cell type which  expressed the molecule.
EXPRESSION_SYSTEM_ORGANELLE          Specific organelle which expressed  the molecule.
EXPRESSION_SYSTEM_CELLULAR_LOCATION  Identifies the location inside or outside
                                     the cell  which expressed the molecule.
EXPRESSION_SYSTEM_VECTOR_TYPE        Identifies the type of vector used,  i.e.,
                                     plasmid,  virus, or cosmid.
EXPRESSION_SYSTEM_VECTOR             Identifies the vector used.
EXPRESSION_SYSTEM_PLASMID            Plasmid used in the recombinant experiment.
EXPRESSION_SYSTEM_GENE               Name of the gene used in  recombinant experiment.
OTHER_DETAILS                        Used to present  information on the source which
                                     is not  given elsewhere.

"""
class CustomPdbParser:
    pdb_path = ""
    pdb_text = ""
    PdbData = ""
    source_key_fragments = ["MOL_ID", "ORGANISM_TAXID","ORGANISM_SCIENTIFIC", "STRAIN", "SYNTHETIC", "FRAGMENT",
                     "ORGANISM_COMMON", "VARIANT", "CELL_LINE", "ATCC", "ORGAN", "TISSUE", "CELL", "ORGANELLE",
                            "SECRETION", "CELLULAR_LOCATION", "PLASMID", "GENE", "EXPRESSION_SYSTEM"]

    compnd_key_fragments =["MOL_ID", "MOLECULE", "CHAIN", "FRAGMENT", "SYNONYM", "EC", "ENGINEERED", "MUTATION", "OTHER_DETAILS"]
    header = {}
    source = []
    compnd = []
    def __init__(self):
        self.header = {}
        self.source = []
        self.compnd = []
    def read_file(self, pdb):
        self.pdb_path = pdb
        f = open(pdb)
        self.pdb_text = f.readlines()

    def parse_source(self, source_text):
        source_dic = {}
        previous_keyword = ""
        multiline_record = False
        for line in source_text:
            #if line.startswith("SOURCE"):
                for key_word in self.source_key_fragments:
                    content, result, enable_multiline = self.extract_record(line, key_word)
                    if not multiline_record and enable_multiline:
                        multiline_record = enable_multiline
                    if ("MOL_ID" in key_word) and result:
                        if len(source_dic) > 0:
                            self.source.append(source_dic)
                            source_dic = {}
                    if result:
                        source_dic[key_word] = content
                        previous_keyword = key_word
                        break
                    elif multiline_record:
                        source_dic[previous_keyword] += " "
                        source_dic[previous_keyword] += line[10:79].strip()
                        multiline_record = False
                        break
        if len(source_dic) > 0:
            self.source.append(source_dic)
        #print(source)
        return self.source

    def extract_record(self, line, record):
        multiline_record = False;
        index = line.find(record, 10)
        if index > 0:
            if line[(index + len(record))] == ":":
                source = line[index + len(f"{record}:"):]
                if ';' in source:
                    multiline_record = False
                    source = source.replace(';', '').replace('\n', '').strip()
                else:
                    multiline_record = True
                source = source.replace('\n', '').strip()
                return  source, 1, multiline_record
        return "", 0, multiline_record

    def parse_compnd(self, compnd_text):
        compnd_dic = {}
        previous_keyword = ""
        multiline_record = False
        for line in compnd_text:
            #if line.startswith("SOURCE"):
                for key_word in self.compnd_key_fragments:
                    content, result, enable_multiline = self.extract_record(line, key_word)
                    if not multiline_record and enable_multiline:
                        multiline_record = enable_multiline
                    if ("MOL_ID" in key_word) and result:
                        if len(compnd_dic) > 0:
                            tmpchain = [i.replace(' ', '') for i in compnd_dic["CHAIN"] if
                                        (len(i.strip()) > 0) and (',' not in i)]
                            compnd_dic["CHAIN"] = tmpchain

                            self.compnd.append(compnd_dic)
                            compnd_dic = {}
                    elif ("CHAIN" in key_word) and result:
                        content = content.split(',')
                    if result:
                        compnd_dic[key_word] = content
                        previous_keyword = key_word
                        break
                    elif multiline_record:
                        compnd_dic[previous_keyword] += " "
                        compnd_dic[previous_keyword] += line[10:79].replace(';','').strip()
                        multiline_record = False
        if len(compnd_dic) > 0:
            tmpchain = [i.replace(' ', '') for i in compnd_dic["CHAIN"] if
                        (len(i.strip()) > 0) and (',' not in i)]
            compnd_dic["CHAIN"] = tmpchain
            self.compnd.append(compnd_dic)
        return self.compnd

    def parse_header(self,header_text):
        for text in header_text:
            self.header['classification'] = text[10:49].strip()
            self.header['depDate'] = text[50:58].strip()
            self.header['idCode'] = text[62:].strip()

        return self.header
    def parse(self, pdb):
        self.read_file(pdb)
        source_text = [i for i in self.pdb_text if i.startswith('SOURCE')]
        header_text = [i for i in self.pdb_text if i.startswith('HEADER')]
        compnd_text = [i for i in self.pdb_text if i.startswith('COMPND')]

        self.parse_header(header_text)
        self.parse_compnd(compnd_text)
        self.parse_source(source_text)

if __name__ == "__main__":
    #filepath = "/home/dante/PDB_antibody/pdb5xs7.pdb"
    filepath = "/home/dante/PDB_antibody/pdb6et5.pdb"
    obj = CustomPdbParser()
    obj.parse(filepath)
    print(obj.source)
    print(obj.header)
    print(obj.compnd)
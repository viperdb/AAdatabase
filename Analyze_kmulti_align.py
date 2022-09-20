import json

from AnnotateAlignment_epitopes import AnnotateAlignmentEpitopes
import matplotlib.pyplot as plt
import pandas as pd

class AnalyzeKmulti:

    def __init__(self):
        self.annotated_alignment = ""
        self.epitope_conservation = []
        self.epitope_conservation_type_int = []
        self.epitope_index = []
        self.kmulti = ""
        pass

    def load_alignment(self, path_file):

        self.kmulti = AnnotateAlignmentEpitopes()
        self.kmulti.kmulti_file = path_file
        self.annotated_alignment = self.kmulti.annotate_alignment()
        #print(self.annotated_alignment)
        self.kmulti.calculate_seq_conservation_consensus()

    def calculate_conservation(self):
        for index, a_row in enumerate(self.annotated_alignment.align):
            epitopes = 0
            type_int = {}
            for strucuture in a_row:
                if "t_int" in strucuture:
                    epitopes += 1
                    if strucuture['t_int'] in type_int:
                        type_int[strucuture['t_int']] += 1
                    else:
                        type_int[strucuture['t_int']] = 1
            if epitopes > 0:
                self.epitope_index.append(index)
            self.epitope_conservation.append(epitopes)
            self.epitope_conservation_type_int.append(type_int)


        #print(self.epitope_conservation)
        #print(self.epitope_conservation_type_int)
        #print(self.epitope_index)
        #self.print_align_resume()

    def print_align_resume(self):
        for index in self.epitope_index:
            print(index)
            frame =pd.DataFrame(self.annotated_alignment.align[index])
            print(frame.head())
            #pprint.pprint(self.annotated_alignment.align[index])
            #for structure in self.annotated_alignment.align[index]:


    def plot_conservation(self):
        plt.bar( range(len(self.epitope_conservation)) , self.epitope_conservation, width=1)
        plt.show()


if __name__ == "__main__":
    #path_file = "/home/dante/Julianne/antigens/kpax_results/4FQI_B/4FQI_B.kmulti"
    path_file = "/home/dante/Julianne/antigens/kpax_results/5K9Q_B/5K9Q_B.kmulti"
    obj = AnalyzeKmulti()
    obj.load_alignment(path_file)
    obj.calculate_conservation()
    print(json.dumps(obj.kmulti.kalign_data))
    #obj.plot_conservation()
    #print("ddd")
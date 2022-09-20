# This file: 4FQI_B_multi_rainbow.tcl
#
# VMD command file to draw a Kpax multiple alignment in rainbow colours.
#
# Here, six colours (red, orange, yellow, green, blue, violet) are allocated
# cyclically from the N-terminus. Aligned residues will appear in the same colour.
# A gap in the alignment causes a colour to be skipped, and singleton residues
# (those not aligned with anything) are coloured in grey.
#
# NB. Rainbow colouring does not work correctly with more than 62 chains.
# NB. The colouring commands only work with Hex version 7.0.1 or higher.
#
# Usage: (cd ./kpax_results/4FQI_B/; vmd -e 4FQI_B_multi_rainbow.tcl)
#
proc load_pair {} {

set red       1 ;
set orange    3 ;
set yellow    4 ;
set green     7 ;
set blue      0 ;
set violet   25 ;
set grey    2 ;

mol default style Tube ;
color Display Background black ;
menu graphics on ;
axes location off ;
display projection orthographic ;

set TheStructure "4FQI_B_multi_rainbow_00001.pdb" ;
mol new $TheStructure type pdb ;
mol delrep 0 top ;
mol selection backbone ;
mol color ColorID $grey ;
mol addrep top ;

set TheChain "A" ;

set TheResidues " 2 8 14 20 26 32 40 46 52 58 64 68 74 80 86 92 98 104 110 116 123 128 134 135 141 147 153 159 165 171" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $red ;
mol addrep top ;

set TheResidues " 3 9 15 21 27 33 41 47 53 59 69 75 81 87 93 99 105 111 117 124 129 136 142 148 154 160 166 172" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $orange ;
mol addrep top ;

set TheResidues " 4 10 16 22 28 34 36 42 48 54 60 70 76 82 88 94 100 106 112 118 130 137 143 149 155 161 167 173" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $yellow ;
mol addrep top ;

set TheResidues " 5 11 17 23 29 35 37 43 49 55 61 65 71 77 83 89 95 101 107 113 119 120 125 131 138 144 150 156 162 168 174" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $green ;
mol addrep top ;

set TheResidues " 6 12 18 24 30 38 44 50 56 62 66 72 78 84 90 96 102 108 114 121 126 132 139 145 151 157 163 169" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $blue ;
mol addrep top ;

set TheResidues " 1 7 13 19 25 31 39 45 51 57 63 67 73 79 85 91 97 103 109 115 122 127 133 140 146 152 158 164 170 176" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $violet ;
mol addrep top ;

set TheResidues " 175" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $grey ;
mol addrep top ;

set TheStructure "4FQI_B_multi_rainbow_00002.pdb" ;
mol new $TheStructure type pdb ;
mol delrep 0 top ;
mol selection backbone ;
mol color ColorID $grey ;
mol addrep top ;

set TheChain "B" ;

set TheResidues " 2 8 14 20 26 32 40 46 52 58 64 68 74 80 86 92 98 104 110 116 123 128 134 135 141 147 153 159 165 171" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $red ;
mol addrep top ;

set TheResidues " 3 9 15 21 27 33 41 47 53 59 69 75 81 87 93 99 105 111 117 124 129 136 142 148 154 160 166 172" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $orange ;
mol addrep top ;

set TheResidues " 4 10 16 22 28 34 36 42 48 54 60 70 76 82 88 94 100 106 112 118 130 137 143 149 155 161 167 173" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $yellow ;
mol addrep top ;

set TheResidues " 5 11 17 23 29 35 37 43 49 55 61 65 71 77 83 89 95 101 107 113 119 120 125 131 138 144 150 156 162 168 174" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $green ;
mol addrep top ;

set TheResidues " 6 12 18 24 30 38 44 50 56 62 66 72 78 84 90 96 102 108 114 121 126 132 139 145 151 157 163 169" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $blue ;
mol addrep top ;

set TheResidues " 1 7 13 19 25 31 39 45 51 57 63 67 73 79 85 91 97 103 109 115 122 127 133 140 146 152 158 164 170 175" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $violet ;
mol addrep top ;

set TheResidues " 176 177 178 179 180" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $grey ;
mol addrep top ;

set TheStructure "4FQI_B_multi_rainbow_00003.pdb" ;
mol new $TheStructure type pdb ;
mol delrep 0 top ;
mol selection backbone ;
mol color ColorID $grey ;
mol addrep top ;

set TheChain "C" ;

set TheResidues " 2 8 14 20 26 32 40 46 52 58 62 68 74 80 86 92 98 104 110 116 123 128 134 135 141 147 153 159 165 171" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $red ;
mol addrep top ;

set TheResidues " 3 9 15 21 27 33 41 47 53 59 69 75 81 87 93 99 105 111 117 124 129 136 142 148 154 160 166 172" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $orange ;
mol addrep top ;

set TheResidues " 4 10 16 22 28 34 36 42 48 54 60 70 76 82 88 94 100 106 112 118 130 137 143 149 155 161 167 173" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $yellow ;
mol addrep top ;

set TheResidues " 5 11 17 23 29 35 37 43 49 55 61 65 71 77 83 89 95 101 107 113 119 120 125 131 138 144 150 156 162 168" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $green ;
mol addrep top ;

set TheResidues " 6 12 18 24 30 38 44 50 56 66 72 78 84 90 96 102 108 114 121 126 132 139 145 151 157 163 169" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $blue ;
mol addrep top ;

set TheResidues " 1 7 13 19 25 31 39 45 51 57 67 73 79 85 91 97 103 109 115 122 127 133 140 146 152 158 164 170" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $violet ;
mol addrep top ;

set TheResidues " 63 64" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $grey ;
mol addrep top ;

set TheStructure "4FQI_B_multi_rainbow_00004.pdb" ;
mol new $TheStructure type pdb ;
mol delrep 0 top ;
mol selection backbone ;
mol color ColorID $grey ;
mol addrep top ;

set TheChain "D" ;

set TheResidues " 65 71 84" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $red ;
mol addrep top ;

set TheResidues " 31 33 46 56 61 72 77 81 85" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $orange ;
mol addrep top ;

set TheResidues " 32 34 35 43 47 62 73 78 82" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $yellow ;
mol addrep top ;

set TheResidues " 32A 36 38 44 48 54 58 74 79 83" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $green ;
mol addrep top ;

set TheResidues " 37 55 59 63 75 80" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $blue ;
mol addrep top ;

set TheResidues " 30 45 60 64 76" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $violet ;
mol addrep top ;

set TheResidues " 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 39 40 41 42 49 50 51 52 53 57 66 67 68 69 70 86 87 88 89 90 91 92 93 94 95 96 97 98 99 100 101 102 103 104 105 106 107 108 109 110 111 112 113 114 115 116 117 118 119 120 121 122 123 124 125 126 127 128 129 130 131 132 133 134 135 136 137 138 139 140 141 142 143 144 145 146 147 148 149 150 151 152 153 154 155 156 157 158 159 160 161 162 163 164 165 166 167 168 169 170 171 172 173 174 175 176 177 178 179 180 181 182 183 184 185 186 187 188 189 190 191 192 193 194 195 196 197 198 199 200 201 202 203 204 205 206 207 208 209 210 211 212" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $grey ;
mol addrep top ;

}

load_pair ;

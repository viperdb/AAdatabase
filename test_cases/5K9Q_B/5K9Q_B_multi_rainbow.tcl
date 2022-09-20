# This file: 5K9Q_B_multi_rainbow.tcl
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
# Usage: (cd ./kpax_results/5K9Q_B/; vmd -e 5K9Q_B_multi_rainbow.tcl)
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

set TheStructure "5K9Q_B_multi_rainbow_00001.pdb" ;
mol new $TheStructure type pdb ;
mol delrep 0 top ;
mol selection backbone ;
mol color ColorID $grey ;
mol addrep top ;

set TheChain "A" ;

set TheResidues " 4 9 15 21 27 33 39 45 51 57 62 68 74 80 86 92 98 104 110 116 122 128 134 140 146 152 158 164 170" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $red ;
mol addrep top ;

set TheResidues " 5 10 16 22 28 34 40 46 52 58 63 69 75 81 87 93 99 105 111 117 123 129 135 141 147 153 159 165 171" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $orange ;
mol addrep top ;

set TheResidues " 6 11 17 23 29 35 41 47 53 64 70 76 82 88 94 100 106 112 118 124 130 136 142 148 154 160 166" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $yellow ;
mol addrep top ;

set TheResidues " 12 18 24 30 36 42 48 54 59 65 71 77 83 89 95 101 107 113 119 125 131 137 143 149 155 161 167" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $green ;
mol addrep top ;

set TheResidues " 7 13 19 25 31 37 43 49 55 60 66 72 78 84 90 96 102 108 114 120 126 132 138 144 150 156 162 168" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $blue ;
mol addrep top ;

set TheResidues " 8 14 20 26 32 38 44 50 56 61 67 73 79 85 91 97 103 109 115 121 127 133 139 145 151 157 163 169" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $violet ;
mol addrep top ;

set TheResidues "" ;

set TheStructure "5K9Q_B_multi_rainbow_00002.pdb" ;
mol new $TheStructure type pdb ;
mol delrep 0 top ;
mol selection backbone ;
mol color ColorID $grey ;
mol addrep top ;

set TheChain "B" ;

set TheResidues " 4 9 15 21 27 33 39 45 51 57 62 68 74 80 86 92 98 104 110 116 122 128 134 140 146 152 158 164 170" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $red ;
mol addrep top ;

set TheResidues " 5 10 16 22 28 34 40 46 52 58 63 69 75 81 87 93 99 105 111 117 123 129 135 141 147 153 159 165 171" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $orange ;
mol addrep top ;

set TheResidues " 6 11 17 23 29 35 41 47 53 64 70 76 82 88 94 100 106 112 118 124 130 136 142 148 154 160 166 172" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $yellow ;
mol addrep top ;

set TheResidues " 12 18 24 30 36 42 48 54 59 65 71 77 83 89 95 101 107 113 119 125 131 137 143 149 155 161 167 173" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $green ;
mol addrep top ;

set TheResidues " 7 13 19 25 31 37 43 49 55 60 66 72 78 84 90 96 102 108 114 120 126 132 138 144 150 156 162 168 174" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $blue ;
mol addrep top ;

set TheResidues " 8 14 20 26 32 38 44 50 56 61 67 73 79 85 91 97 103 109 115 121 127 133 139 145 151 157 163 169" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $violet ;
mol addrep top ;

set TheResidues " 175 176" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $grey ;
mol addrep top ;

set TheStructure "5K9Q_B_multi_rainbow_00003.pdb" ;
mol new $TheStructure type pdb ;
mol delrep 0 top ;
mol selection backbone ;
mol color ColorID $grey ;
mol addrep top ;

set TheChain "C" ;

set TheResidues " 9 15 21 27 33 39 45 51 57 62 68 74 80 86 92 98 104 110 116 122 128 134 140 146 152 158 164 170" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $red ;
mol addrep top ;

set TheResidues " 10 16 22 28 34 40 46 52 58 63 69 75 81 87 93 99 105 111 117 123 129 135 141 147 153 159 165 171" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $orange ;
mol addrep top ;

set TheResidues " 11 17 23 29 35 41 47 53 64 70 76 82 88 94 100 106 112 118 124 130 136 142 148 154 160 166 172" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $yellow ;
mol addrep top ;

set TheResidues " 12 18 24 30 36 42 48 54 59 65 71 77 83 89 95 101 107 113 119 125 131 137 143 149 155 161 167" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $green ;
mol addrep top ;

set TheResidues " 13 19 25 31 37 43 49 55 60 66 72 78 84 90 96 102 108 114 120 126 132 138 144 150 156 162 168 173" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $blue ;
mol addrep top ;

set TheResidues " 14 20 26 32 38 44 50 56 61 67 73 79 85 91 97 103 109 115 121 127 133 139 145 151 157 163 169" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $violet ;
mol addrep top ;

set TheResidues "" ;

set TheStructure "5K9Q_B_multi_rainbow_00004.pdb" ;
mol new $TheStructure type pdb ;
mol delrep 0 top ;
mol selection backbone ;
mol color ColorID $grey ;
mol addrep top ;

set TheChain "D" ;

set TheResidues " 16 338 344 350 356 362 368 374 380 386 415 421 427 433 439 445 451 457 463 469 475 481 487 491 494" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $red ;
mol addrep top ;

set TheResidues " 11 339 345 351 357 363 369 375 381 387 416 422 428 434 440 446 452 458 464 470 476 482 488 495" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $orange ;
mol addrep top ;

set TheResidues " 12 340 346 352 358 364 370 376 382 417 423 429 435 441 447 453 459 465 471 477 483 489 492 496" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $yellow ;
mol addrep top ;

set TheResidues " 341 347 353 359 365 371 377 383 389 418 424 430 436 442 448 454 460 466 472 478 484 497" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $green ;
mol addrep top ;

set TheResidues " 14 342 348 354 360 366 372 378 384 390 419 425 431 437 443 449 455 461 467 473 479 485 490 493" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $blue ;
mol addrep top ;

set TheResidues " 15 343 349 355 361 367 373 379 385 391 420 426 432 438 444 450 456 462 468 474 480 486" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $violet ;
mol addrep top ;

set TheResidues " 13 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 55A 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 83A 84 85 86 87 88 89 90 90A 91 92 93 94 95 96 97 98 99 100 101 102 103 104 105 106 107 108 109 110 111 112 113 114 115 116 116A 116B 116C 117 118 119 120 121 122 123 124 125 126 127 128 129 130 131 132 133 133A 134 135 136 137 138 139 140 141 142 143 144 145 146 147 148 149 150 151 152 153 154 155 156 157 158 159 160 161 162 163 164 165 166 167 168 169 170 171 172 173 174 175 176 177 178 179 180 181 182 183 184 185 186 187 188 189 190 191 192 193 194 195 196 197 198 199 200 201 202 203 204 205 206 207 208 209 210 211 212 213 214 215 216 217 218 219 220 221 222 223 224 225 226 227 228 229 230 231 232 233 234 235 236 237 238 239 240 241 242 243 244 245 246 247 248 249 250 251 252 253 254 255 256 257 258 259 260 261 262 263 264 265 266 266A 267 268 269 270 271 272 273 274 275 276 277 278 279 280 281 282 283 284 285 286 287 288 289 290 291 292 293 294 295 296 297 298 299 300 301 302 303 304 305 306 307 308 309 310 311 312 313 314 315 316 317 318 319 320 321 322 323 324 325 326 327 328 329 330 337 388" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $grey ;
mol addrep top ;

}

load_pair ;

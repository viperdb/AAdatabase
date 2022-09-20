# This file: 5KAQ_B_multi_rainbow.tcl
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
# Usage: (cd ./kpax_results/5KAQ_B/; vmd -e 5KAQ_B_multi_rainbow.tcl)
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

set TheStructure "5KAQ_B_multi_rainbow_00001.pdb" ;
mol new $TheStructure type pdb ;
mol delrep 0 top ;
mol selection backbone ;
mol color ColorID $grey ;
mol addrep top ;

set TheChain "A" ;

set TheResidues " 13 16 21 26 32 41 46 52 60 66 72 78 88 94 99 105 111 121 127 133 138 144 150 156 162 168 174 180 182 187 193 199 205 211 217 223 229 235 241 247 254 264 269 275 280 285 290 296 302 308 314 320 338 344 350 355 361 367 371 375 379 390 395 401 405 411 416 421 426 430 441 445 448 454 459 465 471 477 483 489 495 500" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $red ;
mol addrep top ;

set TheResidues " 22 27 36 42 47 53 61 67 73 79 89 95 100 106 112 122 125 128 139 145 151 157 163 169 175 176 181 183 188 194 200 206 212 218 224 230 236 242 248 251 255 260 265 270 276 286 291 297 303 309 315 321 339 345 356 362 368 372 376 396 402 406 412 417 422 434 438 442 446 449 455 460 466 472 478 484 490 496" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $orange ;
mol addrep top ;

set TheResidues " 17 23 28 33 37 43 48 54 57 62 68 74 80 84 90 96 101 107 113 117 123 129 134 140 146 152 158 164 170 177 189 195 201 207 213 219 225 231 237 243 249 256 266 271 277 281 287 292 298 304 310 316 322 340 346 351 357 363 369 380 384 391 397 403 407 413 418 435 439 443 447 450 456 461 467 473 479 485 491 497 501" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $yellow ;
mol addrep top ;

set TheResidues " 11 18 29 34 38 49 55 58 63 69 75 81 85 91 102 108 114 118 130 135 141 147 153 159 165 171 178 184 190 196 202 208 214 220 226 232 238 244 252 257 261 272 278 282 288 293 299 305 311 317 323 325 341 347 352 358 364 381 385 387 392 398 408 414 419 423 427 431 436 440 444 451 462 468 474 480 486 492 498" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $green ;
mol addrep top ;

set TheResidues " 14 19 24 30 39 44 50 56 64 70 76 82 86 92 97 103 109 115 119 124 131 136 142 148 154 160 166 172 179 185 191 197 203 209 215 221 227 233 239 245 250 258 262 267 273 283 289 294 300 306 312 318 324 326 342 348 353 359 365 373 377 382 386 388 393 399 409 415 424 428 432 437 452 457 463 469 475 481 487 493" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $blue ;
mol addrep top ;

set TheResidues " 12 15 20 25 31 35 40 45 51 59 65 71 77 83 87 93 98 104 110 116 120 126 132 137 143 149 155 161 167 173 186 192 198 204 210 216 222 228 234 240 246 253 259 263 268 274 279 284 295 301 307 313 319 343 349 354 360 366 370 374 378 383 389 394 400 404 410 420 425 429 433 453 458 464 470 476 482 488 494 499" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $violet ;
mol addrep top ;

set TheResidues "" ;

set TheStructure "5KAQ_B_multi_rainbow_00002.pdb" ;
mol new $TheStructure type pdb ;
mol delrep 0 top ;
mol selection backbone ;
mol color ColorID $grey ;
mol addrep top ;

set TheChain "B" ;

set TheResidues " 9 15 21 26 32 38 42 46 50 61 66 72 76 82 87 92 97 101 112 116 119 125 130 136 142 148 154 160 166 171" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $red ;
mol addrep top ;

set TheResidues " 10 16 27 33 39 43 47 67 73 77 83 88 93 105 109 113 117 120 126 131 137 143 149 155 161 167" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $orange ;
mol addrep top ;

set TheResidues " 11 17 22 28 34 40 51 55 62 68 74 78 84 89 106 110 114 118 121 127 132 138 144 150 156 162 168 172" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $yellow ;
mol addrep top ;

set TheResidues " 12 18 23 29 35 52 56 58 63 69 79 85 90 94 98 102 107 111 115 122 133 139 145 151 157 163 169" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $green ;
mol addrep top ;

set TheResidues " 13 19 24 30 36 44 48 53 57 59 64 70 80 86 95 99 103 108 123 128 134 140 146 152 158 164" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $blue ;
mol addrep top ;

set TheResidues " 14 20 25 31 37 41 45 49 54 60 65 71 75 81 91 96 100 104 124 129 135 141 147 153 159 165 170 173" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $violet ;
mol addrep top ;

set TheResidues "" ;

set TheStructure "5KAQ_B_multi_rainbow_00003.pdb" ;
mol new $TheStructure type pdb ;
mol delrep 0 top ;
mol selection backbone ;
mol color ColorID $grey ;
mol addrep top ;

set TheChain "C" ;

set TheResidues " 4 9 15 21 26 32 38 42 46 50 61 66 72 76 82 87 92 97 101 112 116 119 125 130 136 142 148 154 160 166 171" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $red ;
mol addrep top ;

set TheResidues " 10 16 27 33 39 43 47 67 73 77 83 88 93 105 109 113 117 120 126 131 137 143 149 155 161 167" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $orange ;
mol addrep top ;

set TheResidues " 11 17 22 28 34 40 51 55 62 68 74 78 84 89 106 110 114 118 121 127 132 138 144 150 156 162 168" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $yellow ;
mol addrep top ;

set TheResidues " 5 12 18 23 29 35 52 56 58 63 69 79 85 90 94 98 102 107 111 115 122 133 139 145 151 157 163 169" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $green ;
mol addrep top ;

set TheResidues " 7 13 19 24 30 36 44 48 53 57 59 64 70 80 86 95 99 103 108 123 128 134 140 146 152 158 164" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $blue ;
mol addrep top ;

set TheResidues " 6 8 14 20 25 31 37 41 45 49 54 60 65 71 75 81 91 96 100 104 124 129 135 141 147 153 159 165 170" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $violet ;
mol addrep top ;

set TheResidues "" ;

set TheStructure "5KAQ_B_multi_rainbow_00004.pdb" ;
mol new $TheStructure type pdb ;
mol delrep 0 top ;
mol selection backbone ;
mol color ColorID $grey ;
mol addrep top ;

set TheChain "D" ;

set TheResidues " 1 5 9 15 21 26 32 38 42 46 50 61 66 72 76 82 87 92 97 101 112 116 119 125 130 136 142 148 154 160 166 171" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $red ;
mol addrep top ;

set TheResidues " 2 6 10 16 27 33 39 43 47 67 73 77 83 88 93 105 109 113 117 120 126 131 137 143 149 155 161 167" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $orange ;
mol addrep top ;

set TheResidues " 11 17 22 28 34 40 51 55 62 68 74 78 84 89 106 110 114 118 121 127 132 138 144 150 156 162 168 172" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $yellow ;
mol addrep top ;

set TheResidues " 7 12 18 23 29 35 52 56 58 63 69 79 85 90 94 98 102 107 111 115 122 133 139 145 151 157 163 169" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $green ;
mol addrep top ;

set TheResidues " 3 8 13 19 24 30 36 44 48 53 57 59 64 70 80 86 95 99 103 108 123 128 134 140 146 152 158 164" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $blue ;
mol addrep top ;

set TheResidues " 4 14 20 25 31 37 41 45 49 54 60 65 71 75 81 91 96 100 104 124 129 135 141 147 153 159 165 170" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $violet ;
mol addrep top ;

set TheResidues "" ;

set TheStructure "5KAQ_B_multi_rainbow_00005.pdb" ;
mol new $TheStructure type pdb ;
mol delrep 0 top ;
mol selection backbone ;
mol color ColorID $grey ;
mol addrep top ;

set TheChain "E" ;

set TheResidues " 1 5 9 15 21 26 32 38 42 46 50 61 66 72 76 82 87 92 97 101 112 116 119 125 130 136 142 148 154 160 166 171" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $red ;
mol addrep top ;

set TheResidues " 2 6 10 16 27 33 39 43 47 67 73 77 83 88 93 105 109 113 117 120 126 131 137 143 149 155 161 167" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $orange ;
mol addrep top ;

set TheResidues " 11 17 22 28 34 40 51 55 62 68 74 78 84 89 106 110 114 118 121 127 132 138 144 150 156 162 168 172" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $yellow ;
mol addrep top ;

set TheResidues " 7 12 18 23 29 35 52 56 58 63 69 79 85 90 94 98 102 107 111 115 122 133 139 145 151 157 163 169" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $green ;
mol addrep top ;

set TheResidues " 3 8 13 19 24 30 36 44 48 53 57 59 64 70 80 86 95 99 103 108 123 128 134 140 146 152 158 164" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $blue ;
mol addrep top ;

set TheResidues " 4 14 20 25 31 37 41 45 49 54 60 65 71 75 81 91 96 100 104 124 129 135 141 147 153 159 165 170" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $violet ;
mol addrep top ;

set TheResidues "" ;

set TheStructure "5KAQ_B_multi_rainbow_00006.pdb" ;
mol new $TheStructure type pdb ;
mol delrep 0 top ;
mol selection backbone ;
mol color ColorID $grey ;
mol addrep top ;

set TheChain "F" ;

set TheResidues " 4 7 9 15 21 26 32 38 42 46 50 61 66 72 76 82 87 92 97 101 112 116 119 125 130 136 142 148 154 160 166 171 175" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $red ;
mol addrep top ;

set TheResidues " 10 16 27 33 39 43 47 67 73 77 83 88 93 105 109 113 117 120 126 131 137 143 149 155 161 167 176" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $orange ;
mol addrep top ;

set TheResidues " 11 17 22 28 34 40 51 55 62 68 74 78 84 89 106 110 114 118 121 127 132 138 144 150 156 162 168 172" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $yellow ;
mol addrep top ;

set TheResidues " 5 12 18 23 29 35 52 56 58 63 69 79 85 90 94 98 102 107 111 115 122 133 139 145 151 157 163 169 173" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $green ;
mol addrep top ;

set TheResidues " 8 13 19 24 30 36 44 48 53 57 59 64 70 80 86 95 99 103 108 123 128 134 140 146 152 158 164" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $blue ;
mol addrep top ;

set TheResidues " 6 14 20 25 31 37 41 45 49 54 60 65 71 75 81 91 96 100 104 124 129 135 141 147 153 159 165 170 174" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $violet ;
mol addrep top ;

set TheResidues "" ;

set TheStructure "5KAQ_B_multi_rainbow_00007.pdb" ;
mol new $TheStructure type pdb ;
mol delrep 0 top ;
mol selection backbone ;
mol color ColorID $grey ;
mol addrep top ;

set TheChain "G" ;

set TheResidues " 1 9 15 21 26 32 38 42 46 50 61 66 72 76 82 87 92 97 101 112 116 119 125 130 136 142 148 154 160 166 171" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $red ;
mol addrep top ;

set TheResidues " 2 6 10 16 27 33 39 43 47 67 73 77 83 88 93 105 109 113 117 120 126 131 137 143 149 155 161 167" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $orange ;
mol addrep top ;

set TheResidues " 3 11 17 22 28 34 40 51 55 62 68 74 78 84 89 106 110 114 118 121 127 132 138 144 150 156 162 168 172" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $yellow ;
mol addrep top ;

set TheResidues " 7 12 18 23 29 35 52 56 58 63 69 79 85 90 94 98 102 107 111 115 122 133 139 145 151 157 163 169" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $green ;
mol addrep top ;

set TheResidues " 4 8 13 19 24 30 36 44 48 53 57 59 64 70 80 86 95 99 103 108 123 128 134 140 146 152 158 164" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $blue ;
mol addrep top ;

set TheResidues " 5 14 20 25 31 37 41 45 49 54 60 65 71 75 81 91 96 100 104 124 129 135 141 147 153 159 165 170" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $violet ;
mol addrep top ;

set TheResidues "" ;

set TheStructure "5KAQ_B_multi_rainbow_00008.pdb" ;
mol new $TheStructure type pdb ;
mol delrep 0 top ;
mol selection backbone ;
mol color ColorID $grey ;
mol addrep top ;

set TheChain "H" ;

set TheResidues " 32 37 42 48 57 62 68 76 82 88 94 104 110 115 121 127 137 143 149 154 160 166 172 178 184 190 196 198 203 209 215 221 227 233 239 245 251 257 263 270 280 285 291 296 301 306 312 318 324 330 336 355 360 366 371 377 383 387 391 395 414 427 432 437 442 446 457 461 464 470 475 481 487 493 499 505 511" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $red ;
mol addrep top ;

set TheResidues " 38 43 52 58 63 69 77 83 89 95 105 111 116 122 128 138 141 144 155 161 167 173 179 185 191 192 197 199 204 210 216 222 228 234 240 246 252 258 264 267 271 276 281 286 292 302 307 313 319 325 331 337 356 361 372 378 384 388 392 428 433 438 450 454 458 462 465 471 476 482 488 494 500 506" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $orange ;
mol addrep top ;

set TheResidues " 33 39 44 49 53 59 64 70 73 78 84 90 96 100 106 112 117 123 129 133 139 145 150 156 162 168 174 180 186 193 205 211 217 223 229 235 241 247 253 259 265 272 282 287 293 297 303 308 314 320 326 332 338 362 367 373 379 385 396 400 410 429 434 451 455 459 463 466 472 477 483 489 495 501 507 512 516" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $yellow ;
mol addrep top ;

set TheResidues " 28 34 45 50 54 65 71 74 79 85 91 97 101 107 118 124 130 134 146 151 157 163 169 175 181 187 194 200 206 212 218 224 230 236 242 248 254 260 268 273 277 288 294 298 304 309 315 321 327 333 339 341 357 363 368 374 380 397 401 411 415 430 435 439 443 447 452 456 460 467 478 484 490 496 502 508 513" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $green ;
mol addrep top ;

set TheResidues " 31 35 40 46 55 60 66 72 80 86 92 98 102 108 113 119 125 131 135 140 147 152 158 164 170 176 182 188 195 201 207 213 219 225 231 237 243 249 255 261 266 274 278 283 289 299 305 310 316 322 328 334 340 342 358 364 369 375 381 389 393 398 402 412 431 440 444 448 453 468 473 479 485 491 497 503 509" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $blue ;
mol addrep top ;

set TheResidues " 30 36 41 47 51 56 61 67 75 81 87 93 99 103 109 114 120 126 132 136 142 148 153 159 165 171 177 183 189 202 208 214 220 226 232 238 244 250 256 262 269 275 279 284 290 295 300 311 317 323 329 335 343 359 365 370 376 382 386 390 394 399 409 413 426 436 441 445 449 469 474 480 486 492 498 504 510 515 517" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $violet ;
mol addrep top ;

set TheResidues " 27 29 403 404 405 406 407 408 514" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $grey ;
mol addrep top ;

set TheStructure "5KAQ_B_multi_rainbow_00009.pdb" ;
mol new $TheStructure type pdb ;
mol delrep 0 top ;
mol selection backbone ;
mol color ColorID $grey ;
mol addrep top ;

set TheChain "I" ;

set TheResidues " 1 9 15 21 26 32 38 42 46 50 62 67 71 76 82 87 92 97 101 112 116 119 125 130 136 142 148 154 160" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $red ;
mol addrep top ;

set TheResidues " 2 6 10 16 27 33 39 43 47 63 68 77 83 88 93 105 109 113 117 120 126 131 137 143 149 155 161" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $orange ;
mol addrep top ;

set TheResidues " 3 11 17 22 28 34 40 51 55 58 64 72 78 84 89 106 110 114 118 121 127 132 138 144 150 156 162" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $yellow ;
mol addrep top ;

set TheResidues " 7 12 18 23 29 35 52 56 59 73 79 85 90 94 98 102 107 111 115 122 133 139 145 151 157" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $green ;
mol addrep top ;

set TheResidues " 4 8 13 19 24 30 36 44 48 53 57 60 65 69 74 80 86 95 99 103 108 123 128 134 140 146 152 158" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $blue ;
mol addrep top ;

set TheResidues " 5 14 20 25 31 37 41 45 49 54 61 66 70 75 81 91 96 100 104 124 129 135 141 147 153 159" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $violet ;
mol addrep top ;

set TheResidues "" ;

set TheStructure "5KAQ_B_multi_rainbow_00010.pdb" ;
mol new $TheStructure type pdb ;
mol delrep 0 top ;
mol selection backbone ;
mol color ColorID $grey ;
mol addrep top ;

set TheChain "J" ;

set TheResidues " 1 9 15 21 26 32 38 42 46 50 62 67 71 76 82 87 92 97 101 112 116 119 125 130 136 142 148 154 160 166" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $red ;
mol addrep top ;

set TheResidues " 2 6 10 16 27 33 39 43 47 68 77 83 88 93 105 109 113 117 120 126 131 137 143 149 155 161 167" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $orange ;
mol addrep top ;

set TheResidues " 3 11 17 22 28 34 40 51 55 58 63 72 78 84 89 106 110 114 118 121 127 132 138 144 150 156 162 168 171" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $yellow ;
mol addrep top ;

set TheResidues " 12 18 23 29 35 52 56 59 64 73 79 85 90 94 98 102 107 111 115 122 133 139 145 151 157 163 169" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $green ;
mol addrep top ;

set TheResidues " 4 7 13 19 24 30 36 44 48 53 57 60 65 69 74 80 86 95 99 103 108 123 128 134 140 146 152 158 164" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $blue ;
mol addrep top ;

set TheResidues " 5 8 14 20 25 31 37 41 45 49 54 61 66 70 75 81 91 96 100 104 124 129 135 141 147 153 159 165 170" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $violet ;
mol addrep top ;

set TheResidues "" ;

set TheStructure "5KAQ_B_multi_rainbow_00011.pdb" ;
mol new $TheStructure type pdb ;
mol delrep 0 top ;
mol selection backbone ;
mol color ColorID $grey ;
mol addrep top ;

set TheChain "K" ;

set TheResidues " 1 9 15 21 26 32 38 42 46 50 62 67 71 76 82 87 92 97 101 112 116 119 125 130 136 142 148 154 160" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $red ;
mol addrep top ;

set TheResidues " 2 6 10 16 27 33 39 43 47 63 68 77 83 88 93 105 109 113 117 120 126 131 137 143 149 155 161" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $orange ;
mol addrep top ;

set TheResidues " 3 11 17 22 28 34 40 51 55 58 64 72 78 84 89 106 110 114 118 121 127 132 138 144 150 156 162" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $yellow ;
mol addrep top ;

set TheResidues " 12 18 23 29 35 52 56 59 73 79 85 90 94 98 102 107 111 115 122 133 139 145 151 157" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $green ;
mol addrep top ;

set TheResidues " 4 7 13 19 24 30 36 44 48 53 57 60 65 69 74 80 86 95 99 103 108 123 128 134 140 146 152 158" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $blue ;
mol addrep top ;

set TheResidues " 5 8 14 20 25 31 37 41 45 49 54 61 66 70 75 81 91 96 100 104 124 129 135 141 147 153 159" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $violet ;
mol addrep top ;

set TheResidues "" ;

set TheStructure "5KAQ_B_multi_rainbow_00012.pdb" ;
mol new $TheStructure type pdb ;
mol delrep 0 top ;
mol selection backbone ;
mol color ColorID $grey ;
mol addrep top ;

set TheChain "L" ;

set TheResidues " 1 9 15 21 26 32 38 42 46 50 62 67 71 76 82 87 92 97 101 112 116 119 125 130 136 142 148 154 160" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $red ;
mol addrep top ;

set TheResidues " 2 6 10 16 27 33 39 43 47 63 68 77 83 88 93 105 109 113 117 120 126 131 137 143 149 155 161" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $orange ;
mol addrep top ;

set TheResidues " 3 11 17 22 28 34 40 51 55 58 64 72 78 84 89 106 110 114 118 121 127 132 138 144 150 156 162" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $yellow ;
mol addrep top ;

set TheResidues " 12 18 23 29 35 52 56 59 73 79 85 90 94 98 102 107 111 115 122 133 139 145 151 157" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $green ;
mol addrep top ;

set TheResidues " 4 7 13 19 24 30 36 44 48 53 57 60 65 69 74 80 86 95 99 103 108 123 128 134 140 146 152 158" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $blue ;
mol addrep top ;

set TheResidues " 5 8 14 20 25 31 37 41 45 49 54 61 66 70 75 81 91 96 100 104 124 129 135 141 147 153 159" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $violet ;
mol addrep top ;

set TheResidues "" ;

set TheStructure "5KAQ_B_multi_rainbow_00013.pdb" ;
mol new $TheStructure type pdb ;
mol delrep 0 top ;
mol selection backbone ;
mol color ColorID $grey ;
mol addrep top ;

set TheChain "M" ;

set TheResidues " 1 9 15 21 26 32 38 42 46 50 62 67 71 76 82 87 92 97 101 112 116 119 125 130 136 142 148 154 160" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $red ;
mol addrep top ;

set TheResidues " 2 6 10 16 27 33 39 43 47 63 68 77 83 88 93 105 109 113 117 120 126 131 137 143 149 155 161" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $orange ;
mol addrep top ;

set TheResidues " 3 11 17 22 28 34 40 51 55 58 64 72 78 84 89 106 110 114 118 121 127 132 138 144 150 156 162" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $yellow ;
mol addrep top ;

set TheResidues " 12 18 23 29 35 52 56 59 73 79 85 90 94 98 102 107 111 115 122 133 139 145 151 157" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $green ;
mol addrep top ;

set TheResidues " 4 7 13 19 24 30 36 44 48 53 57 60 65 69 74 80 86 95 99 103 108 123 128 134 140 146 152 158" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $blue ;
mol addrep top ;

set TheResidues " 5 8 14 20 25 31 37 41 45 49 54 61 66 70 75 81 91 96 100 104 124 129 135 141 147 153 159" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $violet ;
mol addrep top ;

set TheResidues "" ;

set TheStructure "5KAQ_B_multi_rainbow_00014.pdb" ;
mol new $TheStructure type pdb ;
mol delrep 0 top ;
mol selection backbone ;
mol color ColorID $grey ;
mol addrep top ;

set TheChain "N" ;

set TheResidues " 1 9 15 21 26 32 38 42 46 50 62 67 71 76 82 87 92 97 101 112 116 119 125 130 136 142 148 154 160" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $red ;
mol addrep top ;

set TheResidues " 2 6 10 16 27 33 39 43 47 63 68 77 83 88 93 105 109 113 117 120 126 131 137 143 149 155 161" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $orange ;
mol addrep top ;

set TheResidues " 3 11 17 22 28 34 40 51 55 58 64 72 78 84 89 106 110 114 118 121 127 132 138 144 150 156 162" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $yellow ;
mol addrep top ;

set TheResidues " 12 18 23 29 35 52 56 59 73 79 85 90 94 98 102 107 111 115 122 133 139 145 151 157" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $green ;
mol addrep top ;

set TheResidues " 4 7 13 19 24 30 36 44 48 53 57 60 65 69 74 80 86 95 99 103 108 123 128 134 140 146 152 158" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $blue ;
mol addrep top ;

set TheResidues " 5 8 14 20 25 31 37 41 45 49 54 61 66 70 75 81 91 96 100 104 124 129 135 141 147 153 159" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $violet ;
mol addrep top ;

set TheResidues "" ;

set TheStructure "5KAQ_B_multi_rainbow_00015.pdb" ;
mol new $TheStructure type pdb ;
mol delrep 0 top ;
mol selection backbone ;
mol color ColorID $grey ;
mol addrep top ;

set TheChain "O" ;

set TheResidues " 1 9 15 21 26 32 38 42 46 50 62 67 71 76 82 87 92 97 101 112 116 119 125 130 136 142 148 154 160" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $red ;
mol addrep top ;

set TheResidues " 2 6 10 16 27 33 39 43 47 63 68 77 83 88 93 105 109 113 117 120 126 131 137 143 149 155 161" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $orange ;
mol addrep top ;

set TheResidues " 3 11 17 22 28 34 40 51 55 58 64 72 78 84 89 106 110 114 118 121 127 132 138 144 150 156 162" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $yellow ;
mol addrep top ;

set TheResidues " 12 18 23 29 35 52 56 59 73 79 85 90 94 98 102 107 111 115 122 133 139 145 151 157" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $green ;
mol addrep top ;

set TheResidues " 4 7 13 19 24 30 36 44 48 53 57 60 65 69 74 80 86 95 99 103 108 123 128 134 140 146 152 158" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $blue ;
mol addrep top ;

set TheResidues " 5 8 14 20 25 31 37 41 45 49 54 61 66 70 75 81 91 96 100 104 124 129 135 141 147 153 159" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $violet ;
mol addrep top ;

set TheResidues "" ;

set TheStructure "5KAQ_B_multi_rainbow_00016.pdb" ;
mol new $TheStructure type pdb ;
mol delrep 0 top ;
mol selection backbone ;
mol color ColorID $grey ;
mol addrep top ;

set TheChain "P" ;

set TheResidues " 1 9 15 21 26 32 38 42 46 50 62 67 71 76 82 87 92 97 101 112 116 119 125 130 136 142 148 154 160 166 171" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $red ;
mol addrep top ;

set TheResidues " 2 6 10 16 27 33 39 43 47 68 77 83 88 93 105 109 113 117 120 126 131 137 143 149 155 161 167" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $orange ;
mol addrep top ;

set TheResidues " 3 11 17 22 28 34 40 51 55 58 63 72 78 84 89 106 110 114 118 121 127 132 138 144 150 156 162 168 172" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $yellow ;
mol addrep top ;

set TheResidues " 12 18 23 29 35 52 56 59 64 73 79 85 90 94 98 102 107 111 115 122 133 139 145 151 157 163 169" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $green ;
mol addrep top ;

set TheResidues " 4 7 13 19 24 30 36 44 48 53 57 60 65 69 74 80 86 95 99 103 108 123 128 134 140 146 152 158 164" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $blue ;
mol addrep top ;

set TheResidues " 5 8 14 20 25 31 37 41 45 49 54 61 66 70 75 81 91 96 100 104 124 129 135 141 147 153 159 165 170 173" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $violet ;
mol addrep top ;

set TheResidues "" ;

set TheStructure "5KAQ_B_multi_rainbow_00017.pdb" ;
mol new $TheStructure type pdb ;
mol delrep 0 top ;
mol selection backbone ;
mol color ColorID $grey ;
mol addrep top ;

set TheChain "Q" ;

set TheResidues " 1 9 15 21 26 32 38 42 46 50 62 67 71 76 82 87 92 97 101 112 116 119 125 130 136 142 148 154 160 166 171" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $red ;
mol addrep top ;

set TheResidues " 2 6 10 16 27 33 39 43 47 63 68 77 83 88 93 105 109 113 117 120 126 131 137 143 149 155 161 167 172" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $orange ;
mol addrep top ;

set TheResidues " 3 11 17 22 28 34 40 51 55 58 64 72 78 84 89 106 110 114 118 121 127 132 138 144 150 156 162 168 173" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $yellow ;
mol addrep top ;

set TheResidues " 4 12 18 23 29 35 52 56 59 73 79 85 90 94 98 102 107 111 115 122 133 139 145 151 157 163 169 174" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $green ;
mol addrep top ;

set TheResidues " 5 7 13 19 24 30 36 44 48 53 57 60 65 69 74 80 86 95 99 103 108 123 128 134 140 146 152 158 164" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $blue ;
mol addrep top ;

set TheResidues " 8 14 20 25 31 37 41 45 49 54 61 66 70 75 81 91 96 100 104 124 129 135 141 147 153 159 165 170" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $violet ;
mol addrep top ;

set TheResidues "" ;

set TheStructure "5KAQ_B_multi_rainbow_00018.pdb" ;
mol new $TheStructure type pdb ;
mol delrep 0 top ;
mol selection backbone ;
mol color ColorID $grey ;
mol addrep top ;

set TheChain "R" ;

set TheResidues " 1 9 15 21 26 32 38 42 46 50 62 67 71 76 82 87 92 97 101 112 116 119 125 130 136 142 148 154 160 166 171" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $red ;
mol addrep top ;

set TheResidues " 2 6 10 16 27 33 39 43 47 63 68 77 83 88 93 105 109 113 117 120 126 131 137 143 149 155 161 167 172" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $orange ;
mol addrep top ;

set TheResidues " 3 11 17 22 28 34 40 51 55 58 64 72 78 84 89 106 110 114 118 121 127 132 138 144 150 156 162 168 173" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $yellow ;
mol addrep top ;

set TheResidues " 4 12 18 23 29 35 52 56 59 73 79 85 90 94 98 102 107 111 115 122 133 139 145 151 157 163 169 174" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $green ;
mol addrep top ;

set TheResidues " 5 7 13 19 24 30 36 44 48 53 57 60 65 69 74 80 86 95 99 103 108 123 128 134 140 146 152 158 164" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $blue ;
mol addrep top ;

set TheResidues " 8 14 20 25 31 37 41 45 49 54 61 66 70 75 81 91 96 100 104 124 129 135 141 147 153 159 165 170" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $violet ;
mol addrep top ;

set TheResidues "" ;

set TheStructure "5KAQ_B_multi_rainbow_00019.pdb" ;
mol new $TheStructure type pdb ;
mol delrep 0 top ;
mol selection backbone ;
mol color ColorID $grey ;
mol addrep top ;

set TheChain "S" ;

set TheResidues " 1 9 15 21 26 32 38 42 46 50 62 67 71 76 82 87 92 97 101 112 116 119 125 130 136 142 148 154 160 166 171" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $red ;
mol addrep top ;

set TheResidues " 2 6 10 16 27 33 39 43 47 63 68 77 83 88 93 105 109 113 117 120 126 131 137 143 149 155 161 167 172" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $orange ;
mol addrep top ;

set TheResidues " 3 11 17 22 28 34 40 51 55 58 64 72 78 84 89 106 110 114 118 121 127 132 138 144 150 156 162 168 173" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $yellow ;
mol addrep top ;

set TheResidues " 4 12 18 23 29 35 52 56 59 73 79 85 90 94 98 102 107 111 115 122 133 139 145 151 157 163 169 174" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $green ;
mol addrep top ;

set TheResidues " 5 7 13 19 24 30 36 44 48 53 57 60 65 69 74 80 86 95 99 103 108 123 128 134 140 146 152 158 164" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $blue ;
mol addrep top ;

set TheResidues " 8 14 20 25 31 37 41 45 49 54 61 66 70 75 81 91 96 100 104 124 129 135 141 147 153 159 165 170" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $violet ;
mol addrep top ;

set TheResidues "" ;

set TheStructure "5KAQ_B_multi_rainbow_00020.pdb" ;
mol new $TheStructure type pdb ;
mol delrep 0 top ;
mol selection backbone ;
mol color ColorID $grey ;
mol addrep top ;

set TheChain "T" ;

set TheResidues " 1 9 15 21 26 32 38 42 46 50 62 67 71 76 82 87 92 97 101 112 116 119 125 130 136 142 148 154 160 166 171" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $red ;
mol addrep top ;

set TheResidues " 2 6 10 16 27 33 39 43 47 63 68 77 83 88 93 105 109 113 117 120 126 131 137 143 149 155 161 167 172" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $orange ;
mol addrep top ;

set TheResidues " 3 11 17 22 28 34 40 51 55 58 64 72 78 84 89 106 110 114 118 121 127 132 138 144 150 156 162 168 173" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $yellow ;
mol addrep top ;

set TheResidues " 4 12 18 23 29 35 52 56 59 73 79 85 90 94 98 102 107 111 115 122 133 139 145 151 157 163 169 174" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $green ;
mol addrep top ;

set TheResidues " 5 7 13 19 24 30 36 44 48 53 57 60 65 69 74 80 86 95 99 103 108 123 128 134 140 146 152 158 164 175" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $blue ;
mol addrep top ;

set TheResidues " 8 14 20 25 31 37 41 45 49 54 61 66 70 75 81 91 96 100 104 124 129 135 141 147 153 159 165 170 176" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $violet ;
mol addrep top ;

set TheResidues "" ;

set TheStructure "5KAQ_B_multi_rainbow_00021.pdb" ;
mol new $TheStructure type pdb ;
mol delrep 0 top ;
mol selection backbone ;
mol color ColorID $grey ;
mol addrep top ;

set TheChain "U" ;

set TheResidues " 1 9 15 21 26 32 38 42 46 50 62 67 71 76 82 87 92 97 101 112 116 119 125 130 136 142 148 154 160 166 171 177" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $red ;
mol addrep top ;

set TheResidues " 2 6 10 16 27 33 39 43 47 63 68 77 83 88 93 105 109 113 117 120 126 131 137 143 149 155 161 167 172 178" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $orange ;
mol addrep top ;

set TheResidues " 3 11 17 22 28 34 40 51 55 58 64 72 78 84 89 106 110 114 118 121 127 132 138 144 150 156 162 168 173 179" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $yellow ;
mol addrep top ;

set TheResidues " 4 12 18 23 29 35 52 56 59 73 79 85 90 94 98 102 107 111 115 122 133 139 145 151 157 163 169 174 180" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $green ;
mol addrep top ;

set TheResidues " 7 13 19 24 30 36 44 48 53 57 60 65 69 74 80 86 95 99 103 108 123 128 134 140 146 152 158 164 175" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $blue ;
mol addrep top ;

set TheResidues " 5 8 14 20 25 31 37 41 45 49 54 61 66 70 75 81 91 96 100 104 124 129 135 141 147 153 159 165 170 176" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $violet ;
mol addrep top ;

set TheResidues "" ;

set TheStructure "5KAQ_B_multi_rainbow_00022.pdb" ;
mol new $TheStructure type pdb ;
mol delrep 0 top ;
mol selection backbone ;
mol color ColorID $grey ;
mol addrep top ;

set TheChain "V" ;

set TheResidues " 1 9 15 21 26 32 38 42 46 50 62 67 71 76 82 87 92 97 101 112 116 119 125 130 136 142 148 154 160 166 171 177" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $red ;
mol addrep top ;

set TheResidues " 2 6 10 16 27 33 39 43 47 63 68 77 83 88 93 105 109 113 117 120 126 131 137 143 149 155 161 167 172 178" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $orange ;
mol addrep top ;

set TheResidues " 3 11 17 22 28 34 40 51 55 58 64 72 78 84 89 106 110 114 118 121 127 132 138 144 150 156 162 168 173 179" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $yellow ;
mol addrep top ;

set TheResidues " 4 12 18 23 29 35 52 56 59 73 79 85 90 94 98 102 107 111 115 122 133 139 145 151 157 163 169 174 180" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $green ;
mol addrep top ;

set TheResidues " 7 13 19 24 30 36 44 48 53 57 60 65 69 74 80 86 95 99 103 108 123 128 134 140 146 152 158 164 175" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $blue ;
mol addrep top ;

set TheResidues " 5 8 14 20 25 31 37 41 45 49 54 61 66 70 75 81 91 96 100 104 124 129 135 141 147 153 159 165 170 176" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $violet ;
mol addrep top ;

set TheResidues "" ;

set TheStructure "5KAQ_B_multi_rainbow_00023.pdb" ;
mol new $TheStructure type pdb ;
mol delrep 0 top ;
mol selection backbone ;
mol color ColorID $grey ;
mol addrep top ;

set TheChain "W" ;

set TheResidues " 1 9 15 21 26 32 38 42 46 50 62 67 71 76 82 87 92 97 101 112 116 119 125 130 136 142 148 154 160 166 171 177" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $red ;
mol addrep top ;

set TheResidues " 2 6 10 16 27 33 39 43 47 63 68 77 83 88 93 105 109 113 117 120 126 131 137 143 149 155 161 167 172 178" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $orange ;
mol addrep top ;

set TheResidues " 3 11 17 22 28 34 40 51 55 58 64 72 78 84 89 106 110 114 118 121 127 132 138 144 150 156 162 168 173 179" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $yellow ;
mol addrep top ;

set TheResidues " 4 12 18 23 29 35 52 56 59 73 79 85 90 94 98 102 107 111 115 122 133 139 145 151 157 163 169 174 180" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $green ;
mol addrep top ;

set TheResidues " 7 13 19 24 30 36 44 48 53 57 60 65 69 74 80 86 95 99 103 108 123 128 134 140 146 152 158 164 175" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $blue ;
mol addrep top ;

set TheResidues " 5 8 14 20 25 31 37 41 45 49 54 61 66 70 75 81 91 96 100 104 124 129 135 141 147 153 159 165 170 176" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $violet ;
mol addrep top ;

set TheResidues "" ;

set TheStructure "5KAQ_B_multi_rainbow_00024.pdb" ;
mol new $TheStructure type pdb ;
mol delrep 0 top ;
mol selection backbone ;
mol color ColorID $grey ;
mol addrep top ;

set TheChain "X" ;

set TheResidues " 14 15 21 27 29 41 46 52 66 72 77 88 93 99 105 111 118 127 133 138 144 150 156 162 168 174 180 182 187 193 199 205 211 217 223 229 235 241 247 254 265 269 274 280 290 296 302 308 314 319 344 349 355 366 379 417 425 429 443 447 482 490" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $red ;
mol addrep top ;

set TheResidues " 22 28 36 42 47 61 67 73 78 89 94 100 106 112 116A 119 122 128 139 145 151 157 163 169 175 176 181 183 188 194 200 206 212 218 224 230 236 242 248 251 255 260 266 270 275 285 291 297 303 309 315 320 345 356 361 371 375 391 422 435 439 448 488" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $orange ;
mol addrep top ;

set TheResidues " 17 23 31 37 43 48 57 62 68 74 79 84 90 95 101 107 116B 120 129 134 140 146 152 158 164 170 177 189 195 201 207 213 219 225 231 237 243 249 256 261 266A 271 276 282 286 292 298 304 310 316 321 346 351 357 362 367 381 385 389 418 485 491" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $yellow ;
mol addrep top ;

set TheResidues " 12 18 32 38 49 53 58 63 69 75 80 85 90A 102 108 113 130 135 141 147 153 159 165 171 178 184 190 196 202 208 214 220 226 232 238 244 252 257 262 277 283 287 293 299 305 311 317 322 340 341 352 358 363 390 419 424 428 432 440 444 483 492" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $green ;
mol addrep top ;

set TheResidues " 19 25 39 45 50 54 64 70 76 81 86 91 97 103 109 114 116C 121 125 131 136 142 148 154 160 166 172 179 185 191 197 203 209 215 221 227 233 239 245 250 258 263 267 272 284 288 294 300 306 312 318 323 342 347 353 359 364 374 378 415 436 484 487 493" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $blue ;
mol addrep top ;

set TheResidues " 13 20 26 34 40 51 60 65 71 82 87 92 98 104 110 115 117 126 132 137 143 149 155 161 167 173 186 192 198 204 210 216 222 228 234 240 246 253 259 264 268 273 279 295 301 307 313 343 348 354 360 365 370 382 386 421 433 489" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $violet ;
mol addrep top ;

set TheResidues " 11 16 24 30 33 35 44 55 55A 56 59 83 83A 96 116 123 124 133A 278 281 289 324 325 326 327 328 329 330 337 338 339 350 368 369 372 373 376 377 380 383 384 387 388 416 420 423 426 427 430 431 434 437 438 441 442 445 446 449 450 451 452 453 454 455 456 457 458 459 460 461 462 463 464 465 466 467 468 469 470 471 472 473 474 475 476 477 478 479 480 481 486 494 495 496 497" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $grey ;
mol addrep top ;

set TheStructure "5KAQ_B_multi_rainbow_00025.pdb" ;
mol new $TheStructure type pdb ;
mol delrep 0 top ;
mol selection backbone ;
mol color ColorID $grey ;
mol addrep top ;

set TheChain "Y" ;

set TheResidues " 4 8 11 17 23 28 32 36 47 52 58 65 69 75 81 86 98 104 110 140 145 163 176 181 199" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $red ;
mol addrep top ;

set TheResidues " 1 9 12 14 18 24 29 32A 37 42 48 53 59 66 70 76 82 87 92 99 105 141 146 159 164 177 200" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $orange ;
mol addrep top ;

set TheResidues " 5 13 19 25 33 38 49 54 61 67 71 77 83 88 93 100 106 147 160 178" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $yellow ;
mol addrep top ;

set TheResidues " 20 34 39 44 55 60 62 68 72 78 84 89 94 101 107 143 148 154 179" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $green ;
mol addrep top ;

set TheResidues " 2 6 10 15 21 26 30 35 40 45 51 63 73 79 90 95 96 102 108 144 155 156 161 173" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $blue ;
mol addrep top ;

set TheResidues " 3 7 16 22 27 31 41 46 57 64 74 80 85 91 97 103 109 162 174 175 180" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $violet ;
mol addrep top ;

set TheResidues " 43 50 56 111 112 113 114 115 116 117 118 119 120 121 122 123 124 125 126 127 128 129 130 131 132 133 134 135 136 137 138 139 142 149 150 151 152 153 157 158 165 166 167 168 169 170 171 172 182 183 184 185 186 187 188 189 190 191 192 193 194 195 196 197 198 201 202 203 204 205 206 207 208 209 210 211 212" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $grey ;
mol addrep top ;

set TheStructure "5KAQ_B_multi_rainbow_00026.pdb" ;
mol new $TheStructure type pdb ;
mol delrep 0 top ;
mol selection backbone ;
mol color ColorID $grey ;
mol addrep top ;

set TheChain "Z" ;

set TheResidues " 3 8 10 16 22 27 33 39 50 61 74 80 86 92 108 118 124 130 131 136 183 193 199 218" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $red ;
mol addrep top ;

set TheResidues " 1 11 13 17 23 28 34 40 46 51 62 66 69 75 81 87 93 98 104 109 119 125 132 137 154 184 194 219" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $orange ;
mol addrep top ;

set TheResidues " 4 12 18 24 35 41 52 63 70 76 82 88 94 99 110 120 126 138 179 195" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $yellow ;
mol addrep top ;

set TheResidues " 19 36 42 47 64 68 71 77 78 83 89 95 100 105 121 127 133 139 140 196" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $green ;
mol addrep top ;

set TheResidues " 2 6 14 20 25 31 37 43 48 53 72 84 90 101 106 112 116 122 128 134 141 153 181 185" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $blue ;
mol addrep top ;

set TheResidues " 7 9 15 21 26 32 44 49 65 73 79 85 91 97 102 107 113 117 123 129 182 186 192 198" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $violet ;
mol addrep top ;

set TheResidues " 5 29 30 38 45 54 55 56 57 58 59 60 67 96 103 111 114 115 135 142 149 150 151 152 155 156 157 158 159 160 161 162 163 164 165 166 167 168 169 170 171 172 173 174 175 176 177 178 180 187 188 189 190 191 197 200 201 202 203 204 205 206 207 208 209 210 211 212 213 214 215 216 217 220 221 222 223 224 225 226 227 228 229" ;

set mysel "chain $TheChain and backbone and resid $TheResidues" ;
mol selection $mysel ;
mol color ColorID $grey ;
mol addrep top ;

}

load_pair ;

#encoding: UTF-8
#coding: UTF-8
require './battle'
require './team'
require './iteam'

laBataille = Battle.new
puts "\e[H\e[2J"



puts "............       .  .  ..... .........7NN, ... ..............................."
puts ".......?Z8NNDOI.....  .  ....... ... . .NNN, ... ..............................."
puts "......DNNNNNNNNNNN:.  .  . ... . . ... .NNN, ..  ..............................."
puts "......DNNN......DNNN....NNN ....8NNN....NNN,~NNN8.....:NNN.......NNN............"
puts "......DNNN..... DNNN.. .NNN.....DNND....NNNNNNNNNNN....NNN8.....ZNNN............"
puts "......DNNN......NNNN....NNN.....DNND....NNNN....NNNN...:NNN.....NNN~............"
puts "......DNNNNNNNNNNNN. . .NNN.....DNND....NNN,.....DNNN...DNN$...:NNN............."
puts "......DNNNNNNNNND.......NNN.....DNNN....NNN,.....:NNN...,NNN...NNN~......... .. "
puts "......DNNN...NNNN.. .  .NNN..  .DNNN .  NNN,.....:NNN....NNND.,DNN. . ....... . "
puts "......DNNN....8NNN=.  ..NNN.   .DNNN..  NNN,...  DNND.....NNN.DNN.... .........."
puts "......DNNN.....ZNNN$....NNNN....DNNN....NNN,....NNNN......~NNNNNN.. ........... "
puts "......DNNN......ONNNI....NNNNNNNNNNN....NNNNNNNNNNN........DNNNN................"
puts "......DNNN..   ..DNNN, ....NNNNNNN?... ..ONNNNNNO...........NNN................."
puts "............ .  ..  .   ......  ....     .....  .  .  .   .NNNO.    . ... ... . "
puts ". ................. ... ..... .......  . ..... ...   ..NNNNNND..  . . . .  .  . "
puts "            ..... . .....                             =DNNND..                  "
puts "   .        .......  ..                               ..                        "
puts "   . .      .............                               .                       "
puts "   .        .............                                                       "
puts "            .... ........                                                       "
puts "   .  .NNNNNNNNM.........                                           .~$D.       "
puts "   ..NNNNNNNNNNNNN.......           .     .                         .NNN.       "
puts "   .NNNN.   ...NNNN. .. .                 .                         .NNN.       "
puts "   DNNN..   ....NNNN....DNND   ..NNN...   .DNNNNNN?.   ..DNNNNNND.. .NNNNNNNN,  "
puts " .?NNN..    .....NNNO...DNND   ..NNN.....NNNNNIZNNNN   .NNNNZ?ZDN   .NNNNNNNN,  "
puts " .DNNN..    .....NNND...DNND   ..NNN..  DNNN..  .DNND. .NNN.   ..   .NNN.       "
puts " .DNNN...  ......NNNN...DNND   ..NNN.. .NNN:.....,NNN. .NNNND..     .NNN.       "
puts " .7NNN..    .....NNND...DNND   ..NNN.. .NNNNNNNNNNNNN.  .NNNNNNN.   .NNN.       "
puts " ..DNN$.    ....DNNN....DNNN   ..NNN.. .NNN+        ..   . .?NNNND. .NNN.       "
puts "   $NNN$.   ...NNNNN....INNN   ..NNN.. .NNNN.               ..+NNN. .NNN:       "
puts "   .ZNNNND? INNNNNO.  ...NNNN8,,INNN.. ..NNNNN$,,7NN   .NZ....NNNN. .NNNNN,:DI  "
puts "    ..NNNNNNNNNND..  ... .DNNNNNNNNN..   .ZNNNNNNNNN  .~NNNNNNNND.. ..NNNNNNNN.."
puts "     .. ..ONNN... . ..      ....... ..     ..... ..    ..... ....     ....... .."
puts "  .   .  ..DNNNNI.. . .                                                         "
puts "      .    ..NNNNNN....  "

gets.chomp

puts "\e[H\e[2J"
laBataille.start


SRC_DIR=/home/hieu/workspace/mgizapp/trunk/mgizapp/src
BOOST_ROOT=/home/hieu/workspace/boost/boost_1_52_0/
BOOST_LIBRARYDIR=/home/hieu/workspace/boost/boost_1_52_0/lib64/


rm *.o libmgiza.a

g++ -I$SRC_DIR -I$SRC_DIR/.. -c -fPIC $SRC_DIR/alignment.cpp
g++ -I$SRC_DIR -I$SRC_DIR/.. -c -fPIC $SRC_DIR/AlignTables.cpp
g++ -I$SRC_DIR -I$SRC_DIR/.. -c -fPIC $SRC_DIR/ATables.cpp
g++ -I$SRC_DIR -I$SRC_DIR/.. -c -fPIC $SRC_DIR/collCounts.cpp
g++ -I$SRC_DIR -I$SRC_DIR/.. -c -fPIC $SRC_DIR/Dictionary.cpp
g++ -I$SRC_DIR -I$SRC_DIR/.. -c -fPIC $SRC_DIR/ForwardBackward.cpp
g++ -I$SRC_DIR -I$SRC_DIR/.. -c -fPIC $SRC_DIR/getSentence.cpp
g++ -I$SRC_DIR -I$SRC_DIR/.. -c -fPIC $SRC_DIR/hmm.cpp
g++ -I$SRC_DIR -I$SRC_DIR/.. -c -fPIC $SRC_DIR/HMMTables.cpp
g++ -I$SRC_DIR -I$SRC_DIR/.. -c -fPIC $SRC_DIR/logprob.cpp
#g++ -I$SRC_DIR -I$SRC_DIR/.. -c -fPIC $SRC_DIR/main.cpp
g++ -I$SRC_DIR -I$SRC_DIR/.. -c -fPIC $SRC_DIR/model1.cpp
g++ -I$SRC_DIR -I$SRC_DIR/.. -c -fPIC $SRC_DIR/model2.cpp
g++ -I$SRC_DIR -I$SRC_DIR/.. -c -fPIC $SRC_DIR/model2to3.cpp
g++ -I$SRC_DIR -I$SRC_DIR/.. -c -fPIC $SRC_DIR/model345-peg.cpp
g++ -I$SRC_DIR -I$SRC_DIR/.. -c -fPIC $SRC_DIR/model3.cpp
g++ -I$SRC_DIR -I$SRC_DIR/.. -c -fPIC $SRC_DIR/model3_viterbi.cpp
g++ -I$SRC_DIR -I$SRC_DIR/.. -c -fPIC $SRC_DIR/model3_viterbi_with_tricks.cpp
g++ -I$SRC_DIR -I$SRC_DIR/.. -c -fPIC $SRC_DIR/MoveSwapMatrix.cpp
g++ -I$SRC_DIR -I$SRC_DIR/.. -c -fPIC $SRC_DIR/myassert.cpp
g++ -I$SRC_DIR -I$SRC_DIR/.. -c -fPIC $SRC_DIR/NTables.cpp
g++ -I$SRC_DIR -I$SRC_DIR/.. -c -fPIC $SRC_DIR/Parameter.cpp
g++ -I$SRC_DIR -I$SRC_DIR/.. -c -fPIC $SRC_DIR/parse.cpp
g++ -I$SRC_DIR -I$SRC_DIR/.. -c -fPIC $SRC_DIR/Perplexity.cpp
#g++ -I$SRC_DIR -I$SRC_DIR/.. -c -fPIC $SRC_DIR/plain2snt.cpp
g++ -I$SRC_DIR -I$SRC_DIR/.. -c -fPIC $SRC_DIR/reports.cpp
g++ -I$SRC_DIR -I$SRC_DIR/.. -c -fPIC $SRC_DIR/SetArray.cpp
#g++ -I$SRC_DIR -I$SRC_DIR/.. -c -fPIC $SRC_DIR/snt2cooc.cpp
#g++ -I$SRC_DIR -I$SRC_DIR/.. -c -fPIC $SRC_DIR/snt2cooc-reduce-mem-preprocess.cpp
#g++ -I$SRC_DIR -I$SRC_DIR/.. -c -fPIC $SRC_DIR/snt2plain.cpp
#g++ -I$SRC_DIR -I$SRC_DIR/.. -c -fPIC $SRC_DIR/symal.cpp
g++ -I$SRC_DIR -I$SRC_DIR/.. -c -fPIC $SRC_DIR/transpair_model3.cpp
g++ -I$SRC_DIR -I$SRC_DIR/.. -c -fPIC $SRC_DIR/transpair_model4.cpp
g++ -I$SRC_DIR -I$SRC_DIR/.. -c -fPIC $SRC_DIR/transpair_model5.cpp
g++ -I$SRC_DIR -I$SRC_DIR/.. -c -fPIC $SRC_DIR/TTables.cpp
g++ -I$SRC_DIR -I$SRC_DIR/.. -c -fPIC $SRC_DIR/utility.cpp
g++ -I$SRC_DIR -I$SRC_DIR/.. -c -fPIC $SRC_DIR/vocab.cpp

ar rvs libmgiza.a *.o

g++ -o d4norm -I$SRC_DIR  $SRC_DIR/d4norm.cxx ./libmgiza.a  -L$BOOST_LIBRARYDIR -lboost_system-mt -lboost_thread-mt -lpthread




SRC_DIR=/home/hieu/workspace/mgizapp/trunk/mgizapp/src
BOOST_ROOT=/home/hieu/workspace/boost/boost_1_52_0/
BOOST_LIBRARYDIR=/home/hieu/workspace/boost/boost_1_52_0/lib64/


rm *.o libmgiza.a d4norm hmmnorm mgiza plain2snt snt2cooc snt2cooc-reduce-mem-preprocess snt2plain symal mkcls

g++ -I$SRC_DIR -I$BOOST_ROOT/include -c -fPIC   \
 $SRC_DIR/alignment.cpp \
 $SRC_DIR/AlignTables.cpp \
 $SRC_DIR/ATables.cpp \
 $SRC_DIR/collCounts.cpp \
 $SRC_DIR/Dictionary.cpp \
 $SRC_DIR/ForwardBackward.cpp \
 $SRC_DIR/getSentence.cpp \
 $SRC_DIR/hmm.cpp \
 $SRC_DIR/HMMTables.cpp \
 $SRC_DIR/logprob.cpp \
 $SRC_DIR/model1.cpp \
 $SRC_DIR/model2.cpp \
 $SRC_DIR/model2to3.cpp \
 $SRC_DIR/model345-peg.cpp \
 $SRC_DIR/model3.cpp \
 $SRC_DIR/model3_viterbi.cpp \
 $SRC_DIR/model3_viterbi_with_tricks.cpp \
 $SRC_DIR/MoveSwapMatrix.cpp \
 $SRC_DIR/myassert.cpp \
 $SRC_DIR/NTables.cpp \
 $SRC_DIR/Parameter.cpp \
 $SRC_DIR/parse.cpp \
 $SRC_DIR/Perplexity.cpp \
 $SRC_DIR/reports.cpp \
 $SRC_DIR/SetArray.cpp \
 $SRC_DIR/transpair_model3.cpp \
 $SRC_DIR/transpair_model4.cpp \
 $SRC_DIR/transpair_model5.cpp \
 $SRC_DIR/TTables.cpp \
 $SRC_DIR/utility.cpp \
 $SRC_DIR/vocab.cpp

gcc -c -fPIC $SRC_DIR/cmd.c

ar rvs libmgiza.a *.o

g++ -o d4norm $SRC_DIR/d4norm.cxx      -static -I$BOOST_ROOT -I$SRC_DIR -L. -lmgiza  -L$BOOST_LIBRARYDIR -lboost_system-mt -lboost_thread-mt -lpthread 

g++ -o hmmnorm $SRC_DIR/hmmnorm.cxx    -static -I$BOOST_ROOT -I$SRC_DIR ./libmgiza.a  -L$BOOST_LIBRARYDIR -lboost_system-mt -lboost_thread-mt -lpthread 

g++ -o mgiza $SRC_DIR/main.cpp         -static -I$BOOST_ROOT -I$SRC_DIR ./libmgiza.a  -L$BOOST_LIBRARYDIR -lboost_system-mt -lboost_thread-mt -lpthread 

g++ -o plain2snt $SRC_DIR/plain2snt.cpp

g++ -o snt2cooc  $SRC_DIR/snt2cooc.cpp 

g++ -o snt2cooc-reduce-mem-preprocess $SRC_DIR/snt2cooc-reduce-mem-preprocess.cpp 

g++ -o snt2plain $SRC_DIR/snt2plain.cpp 

g++ -o symal $SRC_DIR/symal.cpp        -static -I$BOOST_ROOT -I$SRC_DIR ./libmgiza.a  -L$BOOST_LIBRARYDIR -lboost_system-mt -lboost_thread-mt -lpthread 

g++ -I$SRC_DIR/mkcls  -o mkcls $SRC_DIR/mkcls/mkcls.cpp $SRC_DIR/mkcls/general.cpp $SRC_DIR/mkcls/KategProblemKBC.cpp $SRC_DIR/mkcls/KategProblem.cpp $SRC_DIR/mkcls/Problem.cpp $SRC_DIR/mkcls/ProblemTest.cpp $SRC_DIR/mkcls/IterOptimization.cpp $SRC_DIR/mkcls/StatVar.cpp $SRC_DIR/mkcls/TAOptimization.cpp $SRC_DIR/mkcls/SAOptimization.cpp $SRC_DIR/mkcls/GDAOptimization.cpp $SRC_DIR/mkcls/MYOptimization.cpp $SRC_DIR/mkcls/RRTOptimization.cpp $SRC_DIR/mkcls/HCOptimization.cpp $SRC_DIR/mkcls/Optimization.cpp $SRC_DIR/mkcls/KategProblemWBC.cpp $SRC_DIR/mkcls/KategProblemTest.cpp



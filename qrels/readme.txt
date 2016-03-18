Short explanation: 
===================
Qrels used in the official results of clef 2015:
qread.eng.clef2015.test.bin.txt
qread.eng.clef2015.test.graded.txt
qrels.eng.clef2015.test.bin.txt
qrels.eng.clef2015.test.graded.txt


Long explanation: 
===================
The following code was used to generate the qrels of CLEF eHealth 2015 IR task:

<assessment_dimension>.<set_of_assessments>.clef2015.<topic_description>.<graduation>.txt

<assessment_dimension>: either qread or qrels, for readability scores and topical relevance scores
<set_of_assessments>: eng, multi or merged. We used in CLEF2015 only the 'eng' assessments. The 'multi' was later created based only on the multi language runs, and the 'merged' is the merge of the other two.
<topic_description>: test or qtest: it is just the name of the topics, e.g., either 'qtest.1' or just '1'
<graduation>: graded or bin: graded or binary relevance

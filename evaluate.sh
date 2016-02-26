#!/bin/bash

#for f in runs/*; do echo $f `~/tools/trec_eval.9.0/trec_eval qrels/qrels.clef2013ehealth.1-50-test.bin.final.20062013.txt $f | grep "P_10 "`; done | sort -k4n

aggregateString="paste"

for f in runs/*
do 
	runName="$( cut -d '/' -f 2 <<< "$f" )"
	groupName="$( cut -d '.' -f 1 <<< "$runName" )"
	#mkdir runs_groupped/$groupName
	mkdir evals_html/$groupName evals_html/$groupName/img evals_html/$groupName/evals evals_html/$groupName/runs runs_groupped/$groupName
	cp $f runs_groupped/$groupName/$runName
	cp $f evals_html/$groupName/runs/$runName
	cp bootstrap.css evals_html/$groupName/
done

for f in runs_groupped/*
do
groupName="$( cut -d '/' -f 2 <<< "$f" )"
nameGroup="$( cut -d '/' -f 2 <<< "$f" )"

echo "Processing "$f
echo "<!DOCTYPE html>" >> evals_html/$groupName/$groupName.html
echo "<html lang=\"en\"><head><meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">" >> evals_html/$groupName/$groupName.html
echo "    <meta charset=\"utf-8\">" >> evals_html/$groupName/$groupName.html
echo "    <title>Share/CLEF eHealth 2015 TASK 2 Results by relevation - Information Retrieval Relevance Judging System</title>" >> evals_html/$groupName/$groupName.html
echo "   <meta name=\"description\" content=\"\">" >> evals_html/$groupName/$groupName.html
echo "    <meta name=\"author\" content=\"CLEF 2015 Task 2 Committee\">" >> evals_html/$groupName/$groupName.html
echo "    <link rel=\"stylesheet\" href=\""bootstrap.css"\">" >> evals_html/$groupName/$groupName.html

#echo "    <link rel=\"stylesheet\" href=\"http://twitter.github.io/bootstrap/assets/css/bootstrap.css\">" >> evals_html/$groupName/$groupName.html


echo "    <style type=\"text/css\">" >> evals_html/$groupName/$groupName.html
echo "        body { padding-top: 60px; font-size: 12px; }" >> evals_html/$groupName/$groupName.html
echo "        label, button, .btn { font-size: 12px; }" >> evals_html/$groupName/$groupName.html
echo "    </style>" >> evals_html/$groupName/$groupName.html
echo "    <!--[if lt IE 9]>" >> evals_html/$groupName/$groupName.html
echo "    <script src=\"//html5shim.googlecode.com/svn/trunk/html5.js\"></script>" >> evals_html/$groupName/$groupName.html
echo "    <![endif]-->" >> evals_html/$groupName/$groupName.html
echo "    <script src=\"./clef_eval_files/jquery.min.js\"></script>" >> evals_html/$groupName/$groupName.html
echo "    <script src=\"./clef_eval_files/bootstrap.min.js\"></script>" >> evals_html/$groupName/$groupName.html
echo "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">" >> evals_html/$groupName/$groupName.html
echo "    <link href=\"http://twitter.github.io/bootstrap/assets/css/bootstrap-responsive.css\" rel=\"stylesheet\">" >> evals_html/$groupName/$groupName.html
echo "<style type=\"text/css\">@media print { #feedlyMiniIcon { display: none; } }</style></head>" >> evals_html/$groupName/$groupName.html
echo "" >> evals_html/$groupName/$groupName.html
echo "<body style=\"zoom: 1;\">" >> evals_html/$groupName/$groupName.html

#echo "<div class=\"navbar navbar-fixed-top\">" >> evals_html/$groupName/$groupName.html
#echo "    <div class=\"navbar-inner\">" >> evals_html/$groupName/$groupName.html
#echo "        <div class=\"container\">" >> evals_html/$groupName/$groupName.html
#echo "            <a class=\"brand\" href=\"./clef_eval_files/clef_eval.html\">relevation</a>" >> evals_html/$groupName/$groupName.html
#echo "            <ul class=\"nav\">" >> evals_html/$groupName/$groupName.html
#echo "                <li><a href=\"./clef_eval_files/clef_eval.html\" class=\"\">Home</a></li>" >> evals_html/$groupName/$groupName.html
#echo "                <li><a href=\"http://aehrc.com/clef2013/upload\">Setup</a></li>" >> evals_html/$groupName/$groupName.html
#echo "                <li class=\"dropdown\">" >> evals_html/$groupName/$groupName.html
#echo "                    <ul class=\"dropdown-menu\">" >> evals_html/$groupName/$groupName.html
#echo "                        <li><a class=\"nav\" href=\"http://aehrc.com/clef2013/?layout=vertical\">Vertical</a></li>" >> evals_html/$groupName/$groupName.html
#echo "                        <li><a href=\"http://aehrc.com/clef2013/?layout=horizontal\">Horizontal</a></li>" >> evals_html/$groupName/$groupName.html
#echo "                        <li><a href=\"http://aehrc.com/clef2013/?layout=inline\">Inline</a></li>" >> evals_html/$groupName/$groupName.html
#echo "                        <li><a href=\"http://aehrc.com/clef2013/?layout=search\">Search</a></li>" >> evals_html/$groupName/$groupName.html
#echo "                        <li><a href=\"http://aehrc.com/clef2013/?layout=horizontal\">Using template</a></li>" >> evals_html/$groupName/$groupName.html
#echo "                    </ul>" >> evals_html/$groupName/$groupName.html
#echo "               </li>" >> evals_html/$groupName/$groupName.html
#echo "                <li><a href=\"http://aehrc.com/clef2013/about\">About</a></li>" >> evals_html/$groupName/$groupName.html
##echo "                <li><a href=\"http://aehrc.com/clef2013/query\">Queries</a></li>" >> evals_html/$groupName/$groupName.html
#echo "            </ul>" >> evals_html/$groupName/$groupName.html
#echo "        </div>" >> evals_html/$groupName/$groupName.html
#echo "    </div>" >> evals_html/$groupName/$groupName.html
#echo "</div>" >> evals_html/$groupName/$groupName.html

echo "<div class=\"container\">" >> evals_html/$groupName/$groupName.html
echo "<div class=\"well\">" >> evals_html/$groupName/$groupName.html
echo "        <h1>Share/CLEF eHealth 2015 TASK 2 Results - "$nameGroup"</h1>" >> evals_html/$groupName/$groupName.html
echo "        <p>This page summarises the results obtained from your submissions. Here, you can find the mean performance of your submissions, for all standard trec_eval measures and for nDCG at different ranks.</br> For this first year, the Share/CLEF eHealth 2015 TASK 2 built result pools from your submissions considering the top 10 documents ranked by your baseline system (run 1), and the two highest priority runs (run 2 and 3); thus all remaining runs were not sampled to form the assessment pool. This was because, unlike in previous years, submissions were greatly differing between each other, and thus lead to very large (and different) pools. As a consequence:<ul><li>the <b>primary measure for this year is precision at 10 (P@10)</b>,</li><li>the <b>secondary measure is Normalised Discounted Cumulative Gain at rank 10</b> (ndcg_cut_10).</li></ul>Per-query performance can be found in the <i>evals</i> folder in the directory containing this HTML page. Note that metrics such as MAP may not be reliable for evaluation due to the limited pool depth.</br>Some of the participant's runs contained formatting errors (the most common was the use of a numeric query id in place of the official qtest2015.XX id); others did not retrieve results for some queries or fail to conform to the TREC result format; finally, some retrieved the same document more than once for the same query (i.e. duplicate documents). To fairly evaluate the runs of every participant, submitted runs containing formatting errors and duplicated documents have been corrected. Duplicate documents have been removed and replaced by a <i>duplicatedid</i> string. Your runs (as evaluated here) are contained in the folder <i>runs</i> - please use these runs if you want to perform further evaluation and analysis.</br></br>Please refer to the <a href=\"https://sites.google.com/site/clefehealth2015/\">ShARe/CLEF 2015 eHealth Evaluation Lab website</a> for additional details on the task.</p></br><p>Relevance assessments are distributed along with this webpage and are also available from the task website. Assessors judged relevance according to a three point scale: Not Relevant (label 0), Somewhat Relevant (label 1), Highly Relevant (label 2). When computing binary relevance measures (e.g. P@10 and MAP), we mapped label 0 to not relevant, and labels 1 and 2 to relevant; this  is encoded in the binary qrels named <i>qrels.clef2015.test.bin.txt</i>. Graded relevance assessments are contained in the <i>qrels.clef2015.test.graded.txt</i> file.</p>" >> evals_html/$groupName/$groupName.html
#        <!-- <p><a class="btn btn-primary" href="https://github.com/bevankoopman/">Check it out on GitHub &raquo;</a></p> -->
echo "    </div>" >> evals_html/$groupName/$groupName.html

echo "    <div class=\"row\">" >> evals_html/$groupName/$groupName.html
        
echo "        <div class=\"span9\">" >> evals_html/$groupName/$groupName.html



echo "            <h2>Evaluation with standard trec_eval metrics</h2>" >> evals_html/$groupName/$groupName.html
echo "        <p>These results have been obtained with the binary relevance assessment, i.e. qrels.clef2015.test.bin.txt, and trec_eval 9.0 <a href=\"http://trec.nist.gov/trec_eval/\">as distributed by NIST</a>. Trec_eval was ran as follows:</p>" >> evals_html/$groupName/$groupName.html
echo "<pre>./trec_eval -c -M1000 qrels.clef2015.test.bin.txt runName</pre>" >> evals_html/$groupName/$groupName.html

for ff in $f/*
do
runName="$( cut -d '/' -f 3 <<< "$ff" )"
#echo $runName " " $ff 
groupName="$( cut -d '.' -f 1 <<< "$runName" )"
	echo " <h4>"$runName"</h4>" >> evals_html/$groupName/$groupName.html
	echo "            <pre>" >> evals_html/$groupName/$groupName.html
~/tools/trec_eval.9.0/trec_eval -c -M1000 qrels/qrels.clef2015.test.bin.txt $ff >> evals_html/$groupName/$groupName.html
~/tools/trec_eval.9.0/trec_eval -q -c -M1000 qrels/qrels.clef2015.test.bin.txt $ff >> evals_html/$groupName/evals/$runName
	
	result=$(grep "P_10 " "evals_html/$groupName/evals/$runName" | grep "qtest" | sed 's/P_10//g' | sed 's/qtest.//g' | sort -k1n | sed 's/                  	//g')
    echo "$result" >> tmp/$runName.p10
    result2=$(awk -F'\t' '{ print $2 }' tmp/$runName.p10)
    echo "$result2" >> tmp/$runName.p10.sel
    aggregateString="$aggregateString tmp/$runName.p10.sel"
	echo "</pre>" >> evals_html/$groupName/$groupName.html
	echo "trec_eval: " $runName
done


echo "" >> evals_html/$groupName/$groupName.html
echo "<h2>Evaluation with nDCG</h2>" >> evals_html/$groupName/$groupName.html
echo "        <p>These results have been obtained with the graded relevance assessment, i.e. qrels.clef2015.test.graded.txt, and trec_eval 9.0 <a href=\"http://trec.nist.gov/trec_eval/\">as distributed by NIST</a>.</br>To obtain nDCG at different ranks, trec_eval was ran as follows:</p>" >> evals_html/$groupName/$groupName.html
echo "<pre>./trec_eval -c -M1000 -m ndcg_cut qrels.clef2015.test.graded.txt runName</pre></br><p>This computes nDCG according to Jarvelin and Kekalainen (ACM ToIS v. 20, pp. 422-446, 2002). Gain values are the relevance values in the qrels file (i.e. label 0 corresponds to gain 0, label 1 to gain 1 and label 2 to gain 2).</p>" >> evals_html/$groupName/$groupName.html
for ff in $f/*
do
runName="$( cut -d '/' -f 3 <<< "$ff" )"
#echo $runName " " $ff 
groupName="$( cut -d '.' -f 1 <<< "$runName" )"
	echo " <h4>"$runName"</h4>" >> evals_html/$groupName/$groupName.html
	echo "            <pre>" >> evals_html/$groupName/$groupName.html
	~/tools/trec_eval.9.0/trec_eval -c -M1000 -m ndcg_cut qrels/qrels.clef2015.test.graded.txt $ff >> evals_html/$groupName/$groupName.html
	~/tools/trec_eval.9.0/trec_eval -q -c -M1000 -m ndcg_cut qrels/qrels.clef2015.test.graded.txt $ff >> evals_html/$groupName/evals/$runName.ndcg
	echo "</pre>" >> evals_html/$groupName/$groupName.html
	echo "ndcg: " $runName
done


echo "" >> evals_html/$groupName/$groupName.html
echo "<h2>Readability-biased evaluation</h2>" >> evals_html/$groupName/$groupName.html
echo "        <p>For this year task, we have considered the factor of understandability of information (or readability) within the evaluation of the submissions, along with the topicality factor (normally referred to as (topical) relevance). Thus, along with (topical) relevance assessments (qrels), we have collected readability assessments (qread). These assessments were provided by judges along with the relevance assessments; however readability was assumed to be assessed independently of (topical) relevance. To account for understandability/readability in the evaluation, we have computed an understandability biased measure, uRBP, as defined in Zuccon&Koopman, <a href=\"http://zuccon.net/publications/medIR2014_healthsearch_readability.pdf\">\"Integrating understandability in the evaluation of consumer health search engines\"</a>, MedIR 2014. We refer to that publication for the motivations and the details of the measure; note however that we did not use automated readability measures to estimate readability - we instead had actual readability assessments from the relevance assessors. Readability assessments were given on a 4 point scale (from 0 to 3): It is very technical and difficult to read and understand (label 0), It is somewhat technical and difficult to read and understand (label 1), It is somewhat easy to read and understand (label 2), It is very easy to read and understand (label 3).</p><p>The results below have been obtained with the binary relevance assessments (i.e. qrels.clef2015.test.bin.txt) and the graded readability assessments (i.e. i.e. qread.clef2015.test.graded.txt), and ubire-v0.1.0 as distributed on <a href=\"https://github.com/ielab/ubire\">GitHub</a>.</br>The tool was ran as follows:</p>" >> evals_html/$groupName/$groupName.html
echo "<pre>java -jar /tools/ubire.0.1.jar --qrels-file=qrels/qrels.clef2015.test.bin.txt --qread-file=qrels/qread.clef2015.test.graded.txt --readability --rbp-p=0.8 --ranking-file=runName</pre></br><p>This computes RBP, and two versions of uRBP. The user persistence parameter <i>p</i> of RBP (and uRBP) was set to 0.8 following Park&Zhang, <a href=\"http://goanna.cs.rmit.edu.au/~aht/adcs2007/papers/17N.PDF\">\"On the distribution of user persistence for rank-biased precision\"</a>, ADCS 2007.  uRBP has been computed by using user model 1 of Zuccon&Koopman with threshold=2, i.e. documents with a readability score of 0 or 1 where deemed not readable and thus had P(U|k)=0, while documents with a readability score of 2 or 3 where deemed readable and thus had P(U|k)=1. uRBPgr has been computed by mapping graded readability scores to different probability values, in particular: readability of 0 was assigned P(U|k)=0, readability of 1 was assigned P(U|k)=0.4, readability of 2 was assigned P(U|k)=0.8, readability of 3 was assigned P(U|k)=1.</br>Note that we are still experimenting with these readability-biased measures and thus observations made with the provided measures may not be conclusive.</p>" >> evals_html/$groupName/$groupName.html
for ff in $f/*
do
runName="$( cut -d '/' -f 3 <<< "$ff" )"
#echo $runName " " $ff 
groupName="$( cut -d '.' -f 1 <<< "$runName" )"
	echo " <h4>"$runName"</h4>" >> evals_html/$groupName/$groupName.html
	echo "            <pre>" >> evals_html/$groupName/$groupName.html
	java -jar /tools/ubire.0.1.jar --qrels-file=qrels/qrels.clef2015.test.bin.txt --qread-file=qrels/qread.clef2015.test.graded.txt --readability --rbp-p=0.8 --ranking-file=$ff >> evals_html/$groupName/$groupName.html
	java -jar /tools/ubire.0.1.jar -q --qrels-file=qrels/qrels.clef2015.test.bin.txt --qread-file=qrels/qread.clef2015.test.graded.txt --readability --rbp-p=0.8 --ranking-file=$ff >> evals_html/$groupName/evals/$runName.urbp
	echo "</pre>" >> evals_html/$groupName/$groupName.html
	echo "rbp: " $runName
done

done

eval $aggregateString >> tmp/p10.all

for f in runs_groupped/*
do
groupName="$( cut -d '/' -f 2 <<< "$f" )"
nameGroup="$( cut -d '/' -f 2 <<< "$f" )"
echo "Getting Plots for "$f
echo "" >> evals_html/$groupName/$groupName.html
echo "<h2>Plots P@10</h2>" >> evals_html/$groupName/$groupName.html
echo "<p>The plots below compare each of your runs against the median and best performance (p@10) across all systems  submitted to CLEF for each query topic. In particular, for each query, the height of a bar represents the gain/loss of your system and the best system (for that query) over the median system. The height of a bar is then given by:</p>" >> evals_html/$groupName/$groupName.html
echo "<pre>grey bars:   height(q) = your_p@10(q) - median_p@10(q)" >> evals_html/$groupName/$groupName.html
echo "white bars:  height(q) = best_p@10(q) - median_p@10(q)</pre>" >> evals_html/$groupName/$groupName.html

echo "" >> evals_html/$groupName/$groupName.html

for ff in $f/*
do
	runName="$( cut -d '/' -f 3 <<< "$ff" )"
	echo "		"$runName
	echo " <h4>"$runName"</h4>" >> evals_html/$groupName/$groupName.html
	echo "setwd(\"/Users/zuccong/Dropbox/clef2015ehealth_t2_organisation/evaluation/tmp\")" >> tmp/rscript.r
	echo "all = read.table(\"p10.all\", sep=\"\t\")" >> tmp/rscript.r
	echo "allmedian <- apply(all,1, median, na.rm=TRUE)"  >> tmp/rscript.r
	echo "allmax <- apply(all,1, max, na.rm=TRUE)"  >> tmp/rscript.r
	echo $runName" = read.table(\""$runName".p10\", sep=\"\t\", col.names=c(\"Topic\", \"p_10\"))" >> tmp/rscript.r
	#echo $runName" <- "$runName"[order("$runName"$Topic),c(1,2)]" >> tmp/rscript.r
	echo "png(\"/Users/zuccong/Dropbox/clef2015ehealth_t2_organisation/evaluation/evals_html/"$groupName"/img/"$runName".p10.png\", 1024, 720)" >> tmp/rscript.r
	echo "par(mar=c(4,4,1,1))" >> tmp/rscript.r
	#echo "layout(rbind(1,2), heights=c(7,1))"  >> tmp/rscript.r
	echo "allmedian">> tmp/rscript.r
	echo $runName"\$p_10">> tmp/rscript.r
	echo $runName"\$p_10 - allmedian" >> tmp/rscript.r
	echo "allmax">> tmp/rscript.r
	echo "barplot(allmax - allmedian, xlab='Topics (qtest)', ylab='gain/loss of p@10 over the median', yaxp = c(-1, 1, 10), ylim=c(-1,1), col=\"white\", cex.names=0.7, names=c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,63,64,65,66,67))" >> tmp/rscript.r
	echo "barplot("$runName"\$p_10 - allmedian, col=\"grey\", add=T, axes=F)" >> tmp/rscript.r
	
	#echo "plot(allmedian, type=\"l\", lty=3, ylim=c(0,1),  xlab='Topics (qtest)', ylab='p@10')" >> tmp/rscript.r
	#echo "points("$runName", col=\"blue\")" >> tmp/rscript.r
	
	#echo "allmax.bar <- barplot(allmax)" >> tmp/rscript.r
	#echo "points(x = allmax.bar, y = allmax - allmedian, pch=3)" >> tmp/rscript.r
	#echo "lines(x = allmax.bar, y = allmax - allmedian, pch=3)" >> tmp/rscript.r
	
	echo "legend('topright',legend=c(\""$runName" vs Median\", \"Best vs Median\"), fill=c(\"gray\", \"white\"), inset=0,cex=1,adj=0, ncol=2, )" >> tmp/rscript.r
	
	echo "dev.off()" >> tmp/rscript.r
	chmod 777 tmp/rscript.r
	R CMD BATCH tmp/rscript.r
	echo "<img src=\"./img/"$runName".p10.png\"/>" >> evals_html/$groupName/$groupName.html
	rm tmp/rscript.r
done

  echo "      </div>" >> evals_html/$groupName/$groupName.html
        
echo "    </div>" >> evals_html/$groupName/$groupName.html
echo "" >> evals_html/$groupName/$groupName.html
echo "    <p></p><hr><p></p>" >> evals_html/$groupName/$groupName.html

echo "    <footer class=\"row\">" >> evals_html/$groupName/$groupName.html
echo "        <div class=\"span6\">" >> evals_html/$groupName/$groupName.html
 echo "           <p><a href=\"https://github.com/ielab/relevation\">relevation</a> - Information Retrieval Relevance Judging System</p>" >> evals_html/$groupName/$groupName.html
  echo "      </div>" >> evals_html/$groupName/$groupName.html
# echo "       <div class=\"span6\" style=\"text-align:right\">" >> evals_html/$groupName/$groupName.html
# echo "           <p>" >> evals_html/$groupName/$groupName.html
#echo "                <a href=\"http://aehrc.com/\">AEHRC</a>" >> evals_html/$groupName/$groupName.html
#echo "            </p>" >> evals_html/$groupName/$groupName.html
#echo "        </div>" >> evals_html/$groupName/$groupName.html
echo "    </footer>" >> evals_html/$groupName/$groupName.html

echo "</div> <!-- container -->" >> evals_html/$groupName/$groupName.html



#echo "<img id=\"feedlyMiniIcon\" title=\"feedly mini\" style=\"position: fixed; bottom: 20px; right: 20px; cursor: pointer; border: 0px; -webkit-transition: opacity 0.5s ease; transition: opacity 0.5s ease; visibility: visible; width: 36px; height: 36px; max-height: 36px; max-width: 36px; overflow: hidden; display: block; padding: 0px; opacity: 0.15;\" width=\"36\" height=\"36\" src=\"data:image/png;base64,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\"></body></html>" >> evals_html/$groupName/$groupName.html
echo "</body></html>" >> evals_html/$groupName/$groupName.html
done
rm tmp/*
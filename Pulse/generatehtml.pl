#!/usr/bin/perl
$wc = `wc -l service.txt`;
@data = `cat service_grep.txt`;
@data1 = `cat health.txt`;
$envSerCnt = `wc -l Standardservice.txt`;
@envService =`cat Standardservice.txt`;
#@dev_status =`cat DEV_stat.txt`;
#@sit_status =`cat SIT_stat.txt`;
#@uat_status =`cat UAT_stat.txt`;
$d1=`date +%d`;
$d2=`date +%b`;
$d3=`date +%Y`;
$d4=`date +%I:%M`;
$d5=`date +%p`;
chomp ($d1);
chomp ($d2);
chomp ($d3);
chomp ($d4);
chomp ($d5);
print "<html><head><style>body{font-family:Arial;font-size:13.5px;}</style></head><body><IMG src=\"logo.bmp\"  align=baseline border=0 hspace=0 >";
print "<h2>Hadoop PCB DEV Health Report as on $d1 $d2 $d3 @ $d4 $d5 GMT </h2>
<h3><u>Cluster Status</u></h3><table border=\"1\"><tr style=\"background-color:rgb(0,50,150)\"><th><font color=\"WHITE\">Service Name</font></th><th><font color=\"WHITE\">Status</font></th><th><font color=\"WHITE\">Reasons</font></th></tr>";
#print "<table border=\"1\"><tr><th>ServiceName</th><th>Status</th><th>Reasons</th></tr>";
for ( $i=0 ; $i<$wc ; $i++)
{
print "<tr>";
$tempService = $data[$i];
chomp ($tempService);
print "<td><b>$tempService</b></td>";
#print "t :".$data1[$i].":";
$tempStatus = $data1[$i];
chomp ($tempStatus);
uc ($tempStatus);
#print "\nt :".$tempStatus.":";
#$tempStatus = "GOOD";
if ($tempStatus eq "GOOD") {
  $tempcolor="GREEN";
}
elsif($tempStatus eq 'BAD') {
  $tempcolor="RED";
}
elsif($tempStatus eq 'NOT_AVAILABLE') {
  $tempcolor="DARKRED";
}
elsif($tempStatus eq 'CONCERNING') {
  $tempcolor="YELLOW";
}
 else {
  $tempcolor="DARKORANGE";
}
print "<td style=\"background-color:".$tempcolor."\">".$tempStatus."</td>";
$grepval= lc($tempService);
chomp $grepval;
$wordcount = `grep '$grepval' final_cutdata.txt | wc -l`;
#print $wordcount;
@reasons = `grep '$grepval' final_cutdata.txt`;
#print $reasons[0];
print "<td>";
if ($wordcount == 0 ){
print "&nbsp";
}
else
{
for ($j = 0; $j < $wordcount; $j++)
{
$temp = $j+1;
print "<b>$temp</b>\. ".$reasons[$j]."<br/>";
}
}
end if
print "</td>";
print "</tr>";
}
end for
print "</table>";
print "<br/><br/><b><u>Additional Info:</u></b><br/><br/><b>Details Link:</b> <a href=\"http://server000002285:7180\" target=\"_blank\">Health Check Link</a><br/><br/> <b>1. Process Status </b> - Unable to get status of job <br/> <b>2. StateStore Connectivity - </b> Resource manager unable to allocate/use resources <br/> <b>3. Daemon Ready Check -</b> Unable to determine if service is running on server <br/> <b>4. Data Directory Free Space - </b>Space issue on server <br/> <b>5. Log Directory Free Space - </b>Log file space issue on server <br/><br/><p> <a href=\"MAILTO:BTSOnDemand\@companycorp.com?subject=PULSE SUBSCRIBE PCBDEV\">Subscribe for this report</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href=\"MAILTO:BTSOnDemand\@companycorp.com?subject=PULSE UNSUBSCRIBE PCBDEV\">Unsubscribe from this report</a></p>";
print "<br/><font color=\"BLUE\" size=\"2\">";
print "* Please note that after clicking any of the link above; your outlook will pop up new email with specific subject. Please do not make any change to subject line and just click \"Send\"</font><br/><br/>";
print "</body></html>";
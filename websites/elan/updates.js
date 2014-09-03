var newsText = new Array();
    newsText[0] = "<font color=\"#FFF8C6\" text-decoration : none; font-size: 12px;>Online Puzzle event Puzzlon has started<font>";
  
    newsText[1] = "<font color=\"#FFF8C6\" text-decoration : none; font-size: 12px;>Registrations For Autonex workshop has started. Register online or 'on the spot'";
    newsText[2] = "<font color=\"#FFF8C6\" text-decoration : none; font-size: 12px;><span  onClick=\"loadPage('alanbates.html');\" >Alan Bates performing @ Big nights</span>";
    newsText[3] = "<font color=\"#FFF8C6\" font-size: 12px;>Click here for transportaion and bus schedule for Autonex workshop";
    newsText[4] = "<font color=\"#FFF8C6\" font-size: 12px;>Last date for abstract submission of Elan Green Circuit Challenge (EGCC) has been shifted to 15th jan 2011";
    newsText[5] = "<font color=\"#FFF8C6\" font-size: 12px;>Cad Eye problem statement has been uploaded ";
    newsText[6] = "<font color=\"#FFF8C6\" font-size: 12px;>Registrations for Celestial Inquisition has started";
    newsText[7] = "<font color=\"#FFF8C6\" font-size: 12px;>Problem Statement for Biolock has been uploaded";
    newsText[8] = "<font color=\"#FFF8C6\" font-size: 12px;>Last date for submission of Machine Rush TDP  has been shifted to 16th jan 2011";
    newsText[9] = "<font color=\"#FFF8C6\" font-size: 12px;>German band Fire on Dawson performing at ELAN";
    newsText[10] = "<font color=\"#FFF8C6\" font-size: 12px;>Fringes gallery is up!";
    newsText[11] = "<font color=\"#FFF8C6\" font-size: 12px;>Problem Statement three for Celestial Inquisition has been uploaded,click here to download .";
    newsText[12] = "<font color=\"#FFF8C6\" font-size: 12px;>Having trouble in registration or logging in ?";
    newsText[13] = "<font color=\"#FFF8C6\" font-size: 12px;>Last date for submission of biolock abstract has been shifted to 20th jan 2011";
    newsText[14] = "<font color=\"#FFF8C6\" font-size: 12px;>Last date for submission of TDP of Robo Epic has been shifted to 15th jan 2011";
    newsText[15] = "<font color=\"#FFF8C6\" font-size: 12px;>Last date for abstract submission of Poster Presesntation has been shifted to 17th jan 2011";
    newsText[16] = "<font color=\"#FFF8C6\" font-size: 12px;>Elan 2k11 goes green , wanna join take the Green Quiz";
	newsText[17] = "<font color=\"#FFF8C6\" font-size: 12px;>Online Programming Contest has started";
	newsText[18] = "<font color=\"#FFF8C6\" font-size: 12px;>Problem statement for <b>Catch Me Bet You</b> has been uploaded";
	newsText[19] = "<font color=\"#FFF8C6\" font-size: 12px;>Prizes worth <b>Rs.4 Lakh</b> to be won.";


var linkURL = new Array();
    linkURL[0]="http://elan.org.in";
    linkURL[1]="./server/eventRegistration.jsp";
    linkURL[2]="http://elan.org.in";
    linkURL[3]="transport.html";
    linkURL[4]="problem_egcc.pdf";
    linkURL[5]="problem_cadeye.pdf";
    linkURL[6]="./server/eventRegistration.jsp";
    linkURL[7]="problem_bio_lock.pdf";
    linkURL[8]="problem_machine_rush.pdf";
    linkURL[9]="http://elan.org.in";
    linkURL[10]="http://elan.org.in/fringes/fringes_gallery.";
    linkURL[11]="./problem_ci3.pdf";
    linkURL[12]="./howtoregister.html";
    linkURL[13]="problem_bio_lock.pdf";
   linkURL[14]="problem_robo_epic.pdf";
   linkURL[15]="http://elan.org.in";
   linkURL[16]="./green_quiz.html";
   linkURL[17]="./programming/";
   linkURL[18]="http://elan.org.in";
   linkURL[19]="http://elan.org.in";
   
var ttloop = 1;    // Repeat forever? (1 = True; 0 = False)
var tspeed = 10;   // Typing speed in milliseconds (larger number = slower)
var tdelay = 5000; // Time delay between newsTexts in milliseconds

// ------------- NO EDITING AFTER THIS LINE ------------- \\
var dwAText="", mylink, cnews=0, cchar=0, timeoutId = 0;

// Set an exclusive timeout, such that only one timer is running at any given
// time
function setExclusiveTimeout(timeId, fn, timeout)
{
    if (timeId > 0) 
        clearTimeout(timeId);
    timeId = 0;
    timeId = setTimeout(fn, timeout);
    timeoutId = timeId;
}

function doNews() {
    addNews();
}

function nextNews()
{
    document.getElementById('tickerSource').innerHTML = "";
    addNews();
}

function previousNews()
{
    document.getElementById('tickerSource').innerHTML = "";
    // HACK ALERT: Add news automatically adds one to the news...
    cnews = (cnews-2)%(newsText.length);
    if (cnews < 0)
        cnews += newsText.length;
    addNews();
}

function addNews() {
    cnews = (cnews + 1)%newsText.length;
    // Reset character pointer
    cchar = 0;
if (cnews!=2)
    {
        dwAText = newsText[cnews];
        mylink = linkURL[cnews];
    }
    else
        {

            dwAText = newsText[cnews];
            
        }
    document.getElementById('tickerSource').innerHTML = "";
    setExclusiveTimeout(timeoutId, "addChar()", tspeed);
}

function addChar() {
    timeoutId = 0;
    // If the string is not yet fully typed
    if (cchar < dwAText.length) 
    {
        nmttxt = "<a href=\""+mylink+"\">"; for (var k=0; k<=cchar;k++) nmttxt += dwAText.charAt(k);
        nmttxt += "</a>";
        document.getElementById('tickerSource').innerHTML = nmttxt;
        cchar += 1;
        if (cchar != dwAText.length)  
            document.getElementById('tickerSource').innerHTML += "_";
        setExclusiveTimeout(timeoutId, "addChar()", tspeed);
    } 
    else 
    {  
        // Get another news item
        setExclusiveTimeout(timeoutId, "addNews()", tdelay);
    }
}

window.onload=function(e){addNews();};

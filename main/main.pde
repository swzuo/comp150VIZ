String fileName = "ProgenDataStreamTotal11-11-12-2.csv";
FileParser filedata;

void setup(){
    filedata = new FileParser(fileName);
    filedata.seperateMission();
    filedata.Notify();
}


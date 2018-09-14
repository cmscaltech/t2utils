import ROOT
import sys

if __name__ == "__main__":
    out = ROOT.TFile("out.root", "RECREATE")
    h_nJet = ROOT.TH1D("nJet", "nJet", 20, 0, 20)
    
    for fi in sys.argv[1:]:
        print fi
        tf = ROOT.TFile.Open("root://cms-xrd-global.cern.ch/" + fi)
        events = tf.Get("Events")
        

        iev = 0
        for event in events:
	    if iev%1000 == 0:
                print iev
            if iev == 10000:
                break
            h_nJet.Fill(event.nJet)

 	    iev += 1
        
    out.Write()
    out.Close()

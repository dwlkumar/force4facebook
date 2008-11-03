public class FacebookNetwork {
    public String nid {get; set;}
    public String name {get; set;}
    public List<Idea> ideas {get; set;}
    
    public FacebookNetwork() {
        this.ideas = new List<Idea>();
    }
}
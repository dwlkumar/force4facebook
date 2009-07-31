public class JSONParser {

    private Integer at = 0;
    private String ch = ' ';
    private String text;


    public static void test() {
        String jsonString = '[{"items":[{"label":"Label Three","link":"http://www.linkthree.com","image":"http://profile.ak.facebook.com/v222/1186/92/q766292291_2330.jpg","description":"Description Three","sublabel":"Sublabel Three","hash":"Label Three"}],"field":"Labels"}]';
        JSONParser jt = new JSONParser();
        JSONObject jo = jt.parse(jsonString);
        System.debug(LoggingLevel.INFO, jo.objectType);
        System.debug(LoggingLevel.INFO, jo.dump());
    }

    /**
     * Parse a JSON string and return an ActionScript object
     * @param text The string to parse
     * @returns The outputted ActionScript object
     */
    public JSONObject parse(String text) {

        //var inst:JSON = getInstance();
        at = 0;
        ch = ' '; //text.substring(0, 1);
        this.text = text;
 
        return value();

    }
    
    private String next() {
        if (at >= text.length()) {
            return null;
        } else {
            ch = text.substring(at, at + 1);
            at += 1;
            return ch;
        }
    }
    
    private void white() {
        while (ch != null) {
            if (ch.equals(' ')) {
                this.next();
            } else if (ch.equals('/')) {
                String n = this.next();
                if (n.equals('/')) {
                    while (this.next() != null && !ch.equals('\n') && !ch.equals('\r')) {}
                } else if (n.equals('*')) {
                    this.next();
                    while(true) {
                        if (ch != null) {
                            if (ch.equals('*')) {
                                if (this.next().equals('/')) {
                                    next();
                                    break;
                                }
                            } else {
                                this.next();
                            }
                        } else {
                            //error("Unterminated comment");
                        }
                    }
                } else {
                    //this.error("Syntax error");
                }
            } else {
                break;
            }
        }
    }
    
    private JSONObject str() {
        JSONObject jo = new JSONObject();
        jo.objectType = 'string';
        jo.stringValue = '';
        
        Integer i; 
        Integer t;
        Integer u;
        
        boolean bouter = false;
    
        if (ch == '"' || ch == '\'') {
            String outerChar = ch;
            while (this.next() != null) {
                if (ch.equals(outerChar)) {
                    this.next();
                    return jo;
                } else if (ch == '/') {
                    String n = this.next();
                    if (n.equals('b')) {
                        jo.stringValue += '\b';
                    } else if (n.equals('f')) {
                        jo.stringValue += '\f';
                    } else if (n.equals('n')) {
                        jo.stringValue += '\n';
                    } else if (n.equals('r')) {
                        jo.stringValue += '\r';
                    } else if (n.equals('t')) {
                        jo.stringValue += '\t';
                    } else if (n.equals('u')) {
                        u = 0;
                        for (i = 0; i < 4; i += 1) {
                            t = Integer.valueOf(this.next());// parseInt(this.next(), 16);
                            /*if (!isFinite(t)) {
                                outer = true;
                            }*/
                            u = u * 16 + t;
                        }
                        if(bouter) {
                            bouter = false;
                        }
                        //s += String.fromCharCode(u);
                    } else {
                        jo.stringValue += ch;
                    }
                } else {
                    jo.stringValue += ch;
                }
            }
        }
        //this.error("Bad string");
        return jo;
    }
    
    private String key()
    {
        String s = ch;
        //boolean outer = false;
        
        Integer semiColon = text.indexOf(':', at);
        
        //Use string handling
        Integer quoteIndex = text.indexOf('"', at);
        Integer squoteIndex = text.indexOf('\'', at);
        if((quoteIndex <= semiColon && quoteIndex > -1) || (squoteIndex <= semiColon && squoteIndex > -1))
        {
            s = str().stringValue;
            white();
            System.debug(ch);
            if(ch.equals(':')) 
            {
                return s;
            }
            else
            {
                //this.error("Bad key");
            }
        }
    
        //Use key handling
        while (this.next() != null) {
            if (ch.equals(':')) {
                return s;
            } 
            if(ch.equals(' ')) // <= ' ')
            {
                
            }
            else
            {
                s += ch;
            }
        }
        //this.error("Bad key");
        return s;
    }
    
    private JSONObject arr() {
        JSONObject jo = new JSONObject();
        jo.objectType = 'array';
        jo.arrayValue = new List<JSONObject>();
        
        if (ch.equals('[')) {
            this.next();
            this.white();
            if (ch.equals(']')) {
                this.next();
                return jo;
            }
            while (ch != null) {
                if(ch.equals(']'))
                {
                    this.next();
                    return jo;
                }
                jo.arrayValue.add(this.value());
                this.white();
                if (ch.equals(']')) {
                    this.next();
                    return jo;
                } else if (!ch.equals(',')) {
                    break;
                }
                this.next();
                this.white();
            }
        }
        //this.error("Bad array");
        return jo;
    }
    
    private JSONObject obj() {
        String k;
        JSONObject o = new JSONObject();
    
        o.objectType = 'object';
        o.mapValue = new Map<String, JSONObject>();
        
        if (ch.equals('{')) {
            this.next();
            this.white();
            if (ch.equals('}')) {
                this.next();
                return o;
            }
            while (ch != null) {
                if(ch.equals('}'))
                {
                    this.next();
                    return o;
                }
                k = this.key();
                if (!ch.equals(':')) {
                    break;
                }
                this.next();
                o.mapValue.put(k, this.value());
                this.white();
                if (ch.equals('}')) {
                    this.next();
                    return o;
                } else if (!ch.equals(',')) {
                    break;
                }
                this.next();
                this.white();
            }
        }
        //this.error("Bad object");
        return o;
    }
    
    private JSONObject num() {
        JSONObject jo = new JSONObject();
        jo.objectType = 'integer';
        
        String n = '';
        Integer v;
    
        if (ch.equals('-')) {
            n = '-';
            this.next();
        }
        while (ch.equals('0') || ch.equals('1') || ch.equals('2') || ch.equals('3') || ch.equals('4') || 
            ch.equals('5') || ch.equals('6') || ch.equals('7') || ch.equals('8') || ch.equals('9'))
/*      while ((ch >= '0' && ch <= '9') || 
                ch == 'x' || 
                (ch >= 'a' && ch <= 'f') ||
                (ch >= 'A' && ch <= 'F')) {*/
        {
            n += ch;
            this.next();
        }
        jo.intValue = Integer.valueOf(n);
        if (ch.equals('.')) {
            jo.objectType = 'double';
            n += '.';
            this.next();
            while (ch.equals('0') || ch.equals('1') || ch.equals('2') || ch.equals('3') || ch.equals('4') || 
                    ch.equals('5') || ch.equals('6') || ch.equals('7') || ch.equals('8') || ch.equals('9'))
/*          while (ch >= '0' && ch <= '9') {*/
            {
                n += ch;
                this.next();
            }
            jo.doubleValue = Double.valueOf(n);
        }
        /*if (ch == 'e' || ch == 'E') {
            n += ch;
            this.next();
            if (ch == '-' || ch == '+') {
                n += ch;
                this.next();
            }
            while (ch >= '0' && ch <= '9') {
                n += ch;
                this.next();
            }
        }*/
        return jo;
    }
    
    private JSONObject word() {
        JSONObject jo = new JSONObject();
        jo.objectType = 'boolean';
        
        if (ch.equals('t')) {
            if (this.next().equals('r') && this.next().equals('u') &&
                    this.next().equals('e')) {
                this.next();
                jo.boolValue = true;
            }
        } else if (ch.equals('f')) {
            if (this.next().equals('a') && this.next().equals('l') &&
                    this.next().equals('s') && this.next().equals('e')) {
                this.next();
                jo.boolValue = false;
            }
        } else if (ch.equals('n')) {
            if (this.next().equals('u') && this.next().equals('l') &&
                    this.next().equals('l')) {
                this.next();
                jo.boolValue = null;
            }
        }
        return jo; //this.error("Syntax error");
    }
    
    private JSONObject value() {
        this.white();
        if (ch.equals('{')) {
            return this.obj();
        } else if (ch.equals('[')) {
            return this.arr();
        } else if (ch.equals('\'') || ch.equals('"')) {
            return this.str();
        } else if (ch.equals('-')) {
            return this.str();
        } else {
            if (ch.equals('0') || ch.equals('1') || ch.equals('2') || ch.equals('3') || ch.equals('4') || 
                    ch.equals('5') || ch.equals('6') || ch.equals('7') || ch.equals('8') || ch.equals('9'))
            {
                return this.num();
            } else {
                return this.word();
            }
        }
    }

}
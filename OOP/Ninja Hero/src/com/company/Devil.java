package com.company;
public class Devil extends Character{
    public Devil(String name,int name2){
        super(name,name2);
    }
    public void stealArmor(){}
    public void attack(Ninja ninja){
        ninja.loseHealth(1);
    }
    public void stealArmor(Ninja ninja){
        ninja.loseArmor(this);
    }
    public void increaseHealth(){
        this.setHealth(this.getHealth()+1);
    }
    public void loseHealth(int d){
        super.loseHealth(d);
    }
}

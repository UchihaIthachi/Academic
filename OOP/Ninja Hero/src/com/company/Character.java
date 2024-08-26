package com.company;
public class Character {
    private int health ;
    private String name;
    public Character(String name,int name2){
        this.name=name;
        this.health= name2;
    }
    public void setName(String name){
        this.name=name;
    }
    public void setHealth(int health) {
        this.health-=health;
    }
    public String getName(){
        return name;
    }
    public int getHealth(){
        return health;
    }

    public void loseHealth(int loseHealth) {
        if (this.getHealth() > 0) {
            this.setHealth(this.getHealth() - loseHealth);
            System.out.println(this.getName() + ": health decrease to " + this.getHealth());
        } else {
            System.out.print(this.getName() + " died!");
        }

    }
}


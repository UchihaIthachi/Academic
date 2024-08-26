package com.company;
public class SuperNinja extends Ninja{
    public SuperNinja(String name, int name2) {
        super(name, name2);
    }

    @Override
    public void attack(Devil devil) {
        devil.loseHealth(2);

    }
    public void loseHealth(int c){
        super.loseHealth(c);
    }

    public void increaseHeakth(){
        this.setHealth(this.getHealth()+1);
        System.out.println(this.getName()+" is increase health by 2,now healt is "+this.getHealth());
    }
}

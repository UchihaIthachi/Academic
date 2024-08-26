package com.company;
public class Ninja extends Character{
    private boolean armor ;
    public Ninja(String name,int name2){
        super(name,name2);
        this.armor = true;
    }
    public void loseArmor(Devil devil){
        if (this.armor==false){
            System.out.println(this.getName()+" haven't a armor.");

        }
        else {
            this.setArmor(false);
            System.out.println(devil.getName() + " steal armor from " + this.getName());
            System.out.println(this.getName()+" lost Armor!");

        }
    }
    public void setArmor(boolean armor){
        this.armor=armor;
    }
    public void gainArmor(){
        if(this.getArmor()==false){
            this.setArmor(true);
        }
        else {
            System.out.println(this.getName()+"already have Armor!");
        }
    }
    public boolean getArmor(){
        return armor;
    }
    public void attack(Devil devil){
        devil.loseHealth(1);
    }
    public void loseHealth(int b){
        super.loseHealth(b);
    }

}

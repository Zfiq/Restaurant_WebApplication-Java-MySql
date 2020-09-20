//Name Zafar Iqbal
//Student ID 1671637

/* This is a model class that contains four variables same as in the Menu database with set getters 
and setters with no Constructor.These variable will be use to Display the final total cost with tax value added.
 */
package WebApp_Restaurant;

public class Menu_Model {

    private int ItemId;
    private String Name;
    private String Category;
    private double Price;

    public int getItemId() {
        return ItemId;
    }

    public void setItemId(int ItemId) {
        this.ItemId = ItemId;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public String getCategory() {
        return Category;
    }

    public void setCategory(String Category) {
        this.Category = Category;
    }

    public double getPrice() {
        return Price;
    }

    public void setPrice(double Price) {
        this.Price = Price;
    }

}

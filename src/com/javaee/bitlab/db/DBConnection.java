package com.javaee.bitlab.db;

import com.javaee.bitlab.db.models.Item;
import com.javaee.bitlab.db.models.User;
import org.postgresql.Driver;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class DBConnection {
    private static Connection connection;

    static {
        try {
            Class.forName("org.postgresql.Driver");
            connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/bitlab_java_ee_db1",
                    "postgres", "postgre");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static ArrayList<Item> getItems() {
        ArrayList<Item> items = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement("SELECT * FROM items");
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Item item = new Item(resultSet.getLong("id"),
                        resultSet.getString("name"),
                        resultSet.getString("description"),
                        resultSet.getDouble("price"));
                items.add(item);
            }
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return items;
    }

    public static Item getItem(Long id) {
        Item item = null;
        try {
            PreparedStatement statement = connection.prepareStatement("SELECT * FROM items where id = ?");
            statement.setLong(1, id);
            ResultSet resultSet = statement.executeQuery();
            item = new Item(resultSet.getLong("id"),
                    resultSet.getString("name"),
                    resultSet.getString("description"),
                    resultSet.getDouble("price"));
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return item;
    }

    public static void addItem(Item item) {
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "INSERT into items (name, description, price) " +
                            "values (?, ?, ?)");
            statement.setString(1, item.getName());
            statement.setString(2, item.getDescription());
            statement.setDouble(3, item.getPrice());
            statement.executeUpdate();
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void deleteItem(Long id) {
        try {
            PreparedStatement statement = connection.prepareStatement("delete items where id = ?");
            statement.setLong(1, id);
            statement.executeUpdate();
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void updateItem(Item item) {
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "update items " +
                            "set name = ?," +
                            "description = ?" +
                            "price = ?" +
                            "where id = ?");
            statement.setString(1, item.getName());
            statement.setString(2, item.getDescription());
            statement.setDouble(3, item.getPrice());
            statement.setLong(4, item.getId());
            statement.executeUpdate();
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
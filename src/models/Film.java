package models;

/**
 * Created by pek18 on 05.06.2017.
 */


public class Film {

    private Long id;

    private String name;

    private String subname;

    private short rating;

    private String year;

    private int time;

    private String description;

    public Film() {

    }

    public Film(Long id, String name, String subname, short rating, String year, int time, String description) {
        this.id = id;
        this.name = name;
        this.subname = subname;
        this.rating = rating;
        this.year = year;
        this.time = time;
        this.description = description;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSubname() {
        return subname;
    }

    public void setSubname(String subname) {
        this.subname = subname;
    }

    public short getRating() {
        return rating;
    }

    public void setRating(short rating) {
        this.rating = rating;
    }

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }

    public int getTime() {
        return time;
    }

    public void setTime(int time) {
        this.time = time;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package it.unica.skynetcinema.model;

import java.sql.Date;
import java.time.LocalDateTime;


/**
 *
 * @author Giacomo
 */
public class Movie {
    private long idMovie;
    private String title;
    private String description;
    private String photo;
    private Date releaseDate;
    private int runningTime;
    private double price;
    private double score;
    private String user_id;

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getScore() {
        return score;
    }

    public void setScore(double score) {
        this.score = score;
    }
    

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    

    public Movie() {
    }
    
    public String getUser_id() {
        return user_id;
    }
    

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }
    
    public long getIdMovie() {
        return idMovie;
    }

    public void setIdMovie(long idMovie) {
        this.idMovie = idMovie;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(Date releaseDate) {
        this.releaseDate = releaseDate;
    }

    public int getRunningTime() {
        return runningTime;
    }

    public void setRunningTime(int runningTime) {
        this.runningTime = runningTime;
    }

    @Override
    public int hashCode() {
        int hash = 5;
        hash = 71 * hash + (int) (this.idMovie ^ (this.idMovie >>> 32));
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Movie other = (Movie) obj;
        return this.idMovie == other.idMovie;
    }
    
    
    
    
    
    
}

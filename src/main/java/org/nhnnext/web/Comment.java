package org.nhnnext.web;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import org.codehaus.jackson.annotate.JsonIgnore;

@Entity
public class Comment {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private	Long id;
	
	@Column
	private String contents;
	
	@JsonIgnore
	@ManyToOne
	private Board board;
	
	//아예 코멘트를 안 달수도 있는 것.
	public Comment(){
	}
	
	public Comment(Board board, String contents){
		this.board = board;
		this.contents = contents;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public Board getBoard() {
		return board;
	}

	public void setBoard(Board board) {
		this.board = board;
	}
	
}

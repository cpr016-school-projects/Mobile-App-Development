package com.example.todolistapp

import java.util.*
import kotlin.properties.Delegates

class Task {
    var id by Delegates.notNull<Int>()
    lateinit var name : String
    var completed : Boolean = false
    lateinit var dueDate : Date
    lateinit var notes : String

    constructor(id : Int, name : String, completed : Boolean, dueDate : Date, notes : String){
        this.id = id
        this.name = name
        this.completed = completed
        this.dueDate = dueDate
        this.notes = notes
    }

//    public getTitle : String {
//        return name
//    }

}
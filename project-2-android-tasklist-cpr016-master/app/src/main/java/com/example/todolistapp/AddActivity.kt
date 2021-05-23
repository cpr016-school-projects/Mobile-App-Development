package com.example.todolistapp

import android.annotation.SuppressLint
import android.app.PendingIntent.getActivity
import android.content.Intent
import android.net.Uri
import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import kotlinx.android.synthetic.main.activity_add.*
import java.text.SimpleDateFormat
import java.util.*
import kotlin.properties.Delegates


class AddActivity : AppCompatActivity() {
    lateinit var taskToUpdate : Task
   // private var edit by Delegates.notNull<Boolean>()

    @SuppressLint("SimpleDateFormat")
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_add)

        val intent: Intent = intent
//        edit = intent.getBooleanExtra("EDIT_BOOL", false)

        save.setOnClickListener {
            intent.putExtra("DUEDAY", datePicker1.getDayOfMonth())
            intent.putExtra("DUEMONTH", datePicker1.getMonth())
            intent.putExtra("DUEYEAR", datePicker1.getYear())




//            taskToUpdate.name = titleEntry.toString()
//            taskToUpdate.completed = completed.isChecked
//            taskToUpdate.notes = notesEntry.toString()
//            taskToUpdate.dueDate = sdf.parse(formattedDate)

            intent.putExtra("NAME", titleEntry.toString())
            intent.putExtra("COMPLETED", completed.isChecked)
            intent.putExtra("NOTES", notesEntry.toString())

            setResult(RESULT_OK, intent)
            finish()
        }
    }

}

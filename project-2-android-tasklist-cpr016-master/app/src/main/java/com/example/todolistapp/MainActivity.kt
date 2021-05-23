package com.example.todolistapp

import android.annotation.SuppressLint
import android.content.Intent
import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import androidx.recyclerview.widget.LinearLayoutManager
import kotlinx.android.synthetic.main.activity_main.*
import androidx.recyclerview.widget.RecyclerView
import kotlinx.android.synthetic.main.activity_add.*
import java.util.*
import kotlin.collections.ArrayList


class MainActivity : AppCompatActivity() {
    private lateinit var recyclerView: RecyclerView
    private lateinit var viewAdapter: RecyclerView.Adapter<RecyclerAdapter.ViewHolder>
    private lateinit var viewManager: RecyclerView.LayoutManager

    private lateinit var myDataset : ArrayList<Task>

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);


        //create tasks
        myDataset = createSampleTasks()
        //create layout manager(this) to manage the recycleradapter
        viewManager = LinearLayoutManager(this)
        //add sample tasks to adapter
        viewAdapter = RecyclerAdapter(myDataset)



        // recycler adapter stuff. This adds a recyclerView which will be be used by this
        // and the RecyclerAdapter to add stuff to
        recyclerView = findViewById<RecyclerView>(R.id.recyclerView).apply {
            // use this setting to improve performance if you know that changes
            // in content do not change the layout size of the RecyclerView
            setHasFixedSize(true)

            // use a linear layout manager
            layoutManager = viewManager

            // specify an viewAdapter (see also next example)
            adapter = viewAdapter

        }

        // on-load update recyclerView
        //recyclerView.adapter.notifyItemInserted(myDataset.size -1)

        // Add button stuff
        //Button add = (Button) findViewById(R.id.add);
        add.setOnClickListener() {
            val myIntent = Intent(this, AddActivity::class.java);
            myIntent.putExtra("ID", myDataset.size) //size because it's +1
            myIntent.putExtra("EDIT_BOOL", false)
            print("\nworked0\n")
            startActivityForResult(myIntent, 100);
        }
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        print("\nworked1\n")
        if (data != null) {
            addTask(data)
        }
    }


    fun createSampleTasks() : ArrayList<Task> {
        var tasklist = arrayListOf<Task>()

        // create example tasks
        tasklist.add(Task(0, "Give Grandma Food", false, Date(), "Food is good mkay?"))
        tasklist.add(Task(1, "Give Grandpa Food as well", false, Date(), "Food is good mkay?"))

        return tasklist
     }

    fun updateTask(task : Task) {
        myDataset
    }

    fun addTask(intent : Intent) {
        val day: Int = intent.getIntExtra("DUEDAY", 0)
        val month: Int = intent.getIntExtra("DUEMONTH", 0)
        val year: Int = intent.getIntExtra("DUEYEAR", 0)
        val calendar: Calendar = Calendar.getInstance()
        calendar.set(year, month, day)

        val date : Date = calendar.time


        val task = Task(intent.getIntExtra("ID", 1000), intent.getStringExtra("NAME").toString(), intent.getBooleanExtra("COMPLETED", false), date, intent.getStringExtra("NOTES"))
        myDataset.add(task)
        recyclerView.adapter?.notifyItemInserted(myDataset.size -1)
        print("\nworked2\n")
    }
}

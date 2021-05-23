package com.example.todolistapp

import android.annotation.SuppressLint
import android.content.Intent
import android.view.LayoutInflater
import android.view.ViewGroup
import android.widget.LinearLayout
import androidx.recyclerview.widget.RecyclerView
import kotlinx.android.synthetic.main.recycler_cell.view.*
import java.text.SimpleDateFormat


class RecyclerAdapter(private val myDataset: ArrayList<Task>) :
    RecyclerView.Adapter<RecyclerAdapter.ViewHolder>() {

    // Provide a reference to the views for each data item
    // Complex data items may need more than one view per item, and
    // you provide access to all the views for a data item in a view holder.
    // Each data item is just a string in this case that is shown in a TextView.
    class ViewHolder(val linearView : LinearLayout) : RecyclerView.ViewHolder(linearView)


    // Create new views (invoked by the layout manager)
    override fun onCreateViewHolder(parent: ViewGroup,
                                    viewType: Int): RecyclerAdapter.ViewHolder {

        val linearView = LayoutInflater.from(parent.context).inflate(R.layout.recycler_cell, parent, false) as LinearLayout


        linearView.edit.setOnClickListener() {
            linearView.context.startActivity(Intent(linearView.context, AddActivity::class.java))
        }

        return ViewHolder(linearView)
    }

    // Replace the contents of a view (invoked by the layout manager)
    @SuppressLint("SimpleDateFormat")
    override fun onBindViewHolder(holder: ViewHolder, position: Int) {
        // - get element from your dataset at this position
        // - replace the contents of the view with that element
        val pattern = "MMM dd, yyyy"
        val simpleDateFormat = SimpleDateFormat(pattern)
        val date = simpleDateFormat.format(myDataset.get(position).dueDate)

        holder.linearView.name.text = myDataset.get(position).name
        holder.linearView.date.text = date


    }
    // Return the size of your dataset (invoked by the layout manager)
    override fun getItemCount() = myDataset.size

}
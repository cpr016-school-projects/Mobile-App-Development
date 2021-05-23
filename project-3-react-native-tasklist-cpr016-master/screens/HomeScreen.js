import React, {useContext} from 'react';
import { StyleSheet, Text, TouchableOpacity, View } from 'react-native';
import { TaskContext } from '../context/TaskContext';

export default function HomeScreen(props) {
let dataContext=useContext(TaskContext)


populateTasks = () => {
    return dataContext.taskArray.map(task => {
        return(
          <TouchableOpacity onPress={pressHandler}>
        <View style={styles.task}>

          <Text>{task}</Text>

        </View>
        </TouchableOpacity>
       )
   })
 }

const pressHandler = () => {
  props.navigation.navigate("Details");
}

 return (
  <View style={styles.container}>
    {populateTasks()}
   </View>
  );
 }

HomeScreen.navigationOptions = ({navigation}) => ({
    headerTitle: "My Tasks",
    headerStyle: {
      backgroundColor: '#f4511e',
    },
    headerRight:() => (
    <TouchableOpacity onPress={()=> navigation.navigate("Details")}>
     <Text style={styles.add}>+</Text>
   </TouchableOpacity>
  )
})


const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: 'orange',
  },
  add:{
    fontSize: 29,
    paddingRight: 20,
    fontWeight: "400"
 },
 task:{
   height: 60,
   margin: 5,
   backgroundColor: 'yellow',
   justifyContent: 'center', 
   paddingLeft: 15
 }
});


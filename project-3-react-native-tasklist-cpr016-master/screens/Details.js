import React,{useContext, useState} from 'react';
import { StyleSheet, TextInput, View,Text , TouchableOpacity, Image} from 'react-native';
import { TaskContext } from '../context/TaskContext';

export default function Details(props) {
let dataContext = useContext(TaskContext)
let [task, setTaskValue] = useState("")
     return (
      <View style={styles.container}>
        <View style={styles.title}>
         <TextInput
          autoFocus={true}
          value={task}
          onChangeText={(val)=> setTaskValue(val)}
          placeholder="Name of new task."
          style={{fontSize: 15, paddingLeft: 10}}
        />
       </View>
   <View style={{alignItems: 'center'}}>
   <TouchableOpacity
     style={styles.save}
     onPress={()=> {
     dataContext.setData(task)
     props.navigation.goBack("")
     }}
   >
      <Text style={{fontSize: 20}}>Save</Text>
    </TouchableOpacity>
  </View>
  </View>
  );
}

Details.navigationOptions = ({navigation}) => ({
    headerTitle:"",
    headerStyle: {
      backgroundColor: '#f4511e',
    },
    headerLeft: () => (
    <TouchableOpacity onPress={()=> navigation.goBack()}>
      <Text style={styles.back}> Back </Text>
    </TouchableOpacity>
    )
  })

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: 'orange'
  },
  title:{
    height: 60,
    backgroundColor: 'yellow',
    justifyContent: 'center',
    margin: 10
  },
  save:{
    marginTop: 150,
    alignItems: 'center',
    backgroundColor: 'yellow',
    width: 250,  
    borderRadius: 15
  },
  back:{
    paddingLeft: 15,
    fontSize: 15
  }
});


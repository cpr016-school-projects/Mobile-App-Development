import React from 'react';
import { TaskContext} from './TaskContext';

export default class TaskContextWrapper extends React.Component {

    state = {
        setData: (val) => {
        this.setState(prevState => {
            prevState["taskArray"].push(val)
            return prevState;
            })
        },
        taskArray: []
    }
    render() {
        return <TaskContext.Provider value={this.state}>
                {this.props.children}
            </TaskContext.Provider>
    }
}
import HomeScreen from "./screens/HomeScreen";
import Details from "./screens/Details";
import {createAppContainer} from "react-navigation";
import {createStackNavigator} from "react-navigation-stack";

export default createAppContainer(
  createStackNavigator({
    Home: HomeScreen,
    Details: Details
  })
);
import React from 'react';
import {NativeEventEmitter, NativeModules, AppRegistry, View, Text, Image, ScrollView, TextInput, Button, Alert} from 'react-native';
const { JSBridge } = NativeModules;

const App = () => {
  console.log('页面启动')
  const invokeJSAPI = () => {
    JSBridge.invokeJSAPI({
      pluginName: 'http',
      method: 'request',
      params: {
        url: 'https://domain/path'
      },
      calBackName: 'callBackName_123456'
    }, (error, events) => {
      if (error) {
        console.error(error);
      } else {
        console.log(events);
      }
    });
  };

  const notificaitonListen = () => {
    const eventEmitter = new NativeEventEmitter(JSBridge);
    const subscription = eventEmitter.addListener(
      'EventReminder',
      (reminder) => {
        Alert.alert(reminder.message);
      }
    );
    /* subscription.remove(); */
  };
  notificaitonListen();

  return (
    <ScrollView>
      <Text>Some text</Text>
      <View>
        <Text>Some more text</Text>
        <Image
          source={{
            uri: 'https://reactnative.dev/docs/assets/p_cat2.png',
          }}
          style={{ width: 200, height: 200 }}
        />
      </View>
      <TextInput
        style={{
          height: 40,
          borderColor: 'gray',
          borderWidth: 1
        }}
        defaultValue="You can type in me"
      />
      <Button title="Press Me" onPress={ invokeJSAPI() } />
    </ScrollView>
  );
}

export default App;

// 模块名称
AppRegistry.registerComponent('MyReactNativeApp', () => App);

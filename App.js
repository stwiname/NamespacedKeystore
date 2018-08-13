/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow
 */

import React, {Component} from 'react';
import {Platform, StyleSheet, Text, View, NativeModules } from 'react-native';

const instructions = Platform.select({
  ios: 'Press Cmd+R to reload,\n' + 'Cmd+D or shake for dev menu',
  android:
    'Double tap R on your keyboard to reload,\n' +
    'Shake or press menu button for dev menu',
});

type Props = {};
export default class App extends Component<Props> {

  constructor(props) {
    super(props);
    this.state = {
      keys: [],
      error: null
    };
  }

  componentDidMount() {
    this.loadKeys();
  }

  render() {
    return (
      <View style={styles.container}>
        <Text style={styles.welcome}>Welcome to React Native!</Text>
        { this.state.keys.map((key, index) => <Text key={index} style={styles.instructions}>{key}</Text>) }
        { !!this.state.error && <Text style={styles.error}>{this.state.error.message}</Text>}
      </View>
    );
  }

  loadKeys() {
    if (NativeModules.MockKeyStore) {
      NativeModules.MockKeyStore.getKeys().then((keys) => {
        this.setState({
          keys
        });
      });
    }
    else {
      this.setState({
        error: new Error('Native module not found')
      })
    }
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF',
  },
  welcome: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10,
  },
  instructions: {
    textAlign: 'center',
    color: '#333333',
    marginBottom: 5,
  },
  error: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10,
    color: 'red'
  },
});

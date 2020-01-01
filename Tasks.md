# Tasks
```kotlin
// 20:12:55 - To-Do List
// 11:01:20 - first app built preview
class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
           App()
        }
    }
}

@Model
class State(var items: MutableList<String> = mutableListOf("j"),
            var count: Int = 0,
            var itemToAdd:String = "Enter sth")

@Model
class E(var show: Boolean = false)
```
## App
```

@Composable
fun App(state: State = State()){
    val arr = mutableListOf("Filip")

   MaterialTheme {
       FlexColumn {

           expanded(flex = 1f){
               bar(state, E())
              // ButtonRow(state, E())
           }
           
          expanded(flex = 1f) {
              Enter(state)
          }

           expanded(flex = 8f){
               Items(state)
           }

       }
   }
}


## AppBar
```kotlin
@Composable
fun bar(state: State, next: E){
     TopAppBar(title = {
         Row {
             Text("${state.count.absoluteValue} Tasks")
             Button("+", onClick = {
                 if (state.itemToAdd.isNotEmpty()) {
                     state.items.add(state.itemToAdd);
                     state.count += 1;
                     state.itemToAdd = "";
                 } else {
                     next.show = true;
                 }
             })

             alert(next)
         }

     })
}
```

## Alert
```kotlin
@Composable
fun alert(next: E){

    if (next.show) {
        AlertDialog(
            onCloseRequest = {
                print("")
            },
            title = {
                Text("Message empty.")
            },


            text = {
                Text("Please enter some text.")
            },

            confirmButton = {
                Button(text = "Ok", onClick = {
                    println("I do it on!")
                    next.show = false
                })
            }
            // Content()
        )
    }
}

```

## Items
```kotlin
@Composable
fun Items(state: State){
        Column {
            for (i in state.items){
                Padding(padding = 10.dp){
                   Item(i)
                }
            }
        }
}
```


```kotlin
@Composable
fun Item(text: String){
    MaterialTheme {
       // Card(shape = RoundedCornerShape(8.dp)) {
            val typo = +MaterialTheme.typography()
            Text(text, style = typo.h6)
      //  }
    }
}
```

```kotlin
@Composable
fun Enter(state: State){
    Padding(padding = 10.dp){
        TextField(value = state.itemToAdd, onValueChange = {state.itemToAdd = it})
    }
}
```

## Preview
```kotlin
@Preview
@Composable
fun DefaultPreview() {
  App()
}
```





```

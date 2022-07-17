import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xo_game/game_logic.dart';
import 'package:xo_game/provider.dart';
class HomePage extends StatelessWidget {
   HomePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx)=>MyProvider(),
      builder: (ctx,_){
        var provider=Provider.of<MyProvider>(ctx);
        return Scaffold(
          backgroundColor:Theme.of(context).primaryColor,
          body:SafeArea(
            child: Column(
              children: [
                SwitchListTile.adaptive(
                  title:const
                  Text("Turn on/off two player",style:
                  TextStyle(color: Colors.white,
                  fontSize: 28),textAlign: TextAlign.center,),
                  value: provider.isSwitched,
                  onChanged: (val)=>provider.changeSwitch(val),


                ),
                SizedBox(height: 10,),
                Text("It's ${provider.activePlayer} turn",style:
                TextStyle(color: Colors.white,
                    fontSize:55),textAlign: TextAlign.center,),
                Expanded(
                  child: GridView.count(
                    padding: EdgeInsets.all(16),
                      crossAxisCount: 3,
                   mainAxisSpacing: 10,
                    crossAxisSpacing:10 ,
                    childAspectRatio:1 ,
                    children:List.generate(9,
                            (index) =>InkWell(
                              borderRadius: BorderRadius.circular(16),
                              onTap:provider.gameOver?null:()=>provider.onTap1(index),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Theme.of(context).shadowColor,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child:Center(
                                    child: Text(
                                    Player.playerX.contains(index)?"X":
                                        Player.playerO.contains(index)?'O':''
                                    ,style:
                                      TextStyle(fontSize: 50,
                                          color:Player.playerX.contains(index)?Colors.blue:Colors.pink

                                      ),)),

                              ),
                            )),

                  ),
                ),
                Text(provider.result,style:
                TextStyle(color: Colors.white,
                    fontSize: 35),textAlign: TextAlign.center,),
                ElevatedButton.icon(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Theme.of(context).splashColor,
                    ),
                  ),
                  icon: Icon(Icons.replay),
                    onPressed: ()=>provider.repeatTheGame(),
                    label: Text('Repeat the game')),

              ],
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xo_game/game_logic.dart';
import 'package:xo_game/provider.dart';
class HomePage extends StatelessWidget {
   const HomePage({Key? key}) : super(key: key);


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
               Padding(
                 padding:const EdgeInsets.only(
                   top: 40,left: 10,right: 10,bottom: 15
                 ),
                 child:
                 SwitchListTile.adaptive(

                   title:const
                   Text("Turn on/off two player",style:
                   TextStyle(color: Colors.white,
                       fontSize: 24,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),),
                   value: provider.isSwitched,
                   onChanged: (val)=>provider.changeSwitch(val),


                 ),
               ),
              const  SizedBox(height: 20,),
              provider.result.isEmpty?  Text("It's ${provider.activePlayer} turn",style:
               const TextStyle(color: Colors.white,
                    fontSize:55,fontWeight:FontWeight.bold,fontStyle: FontStyle.italic)):const Text(""),
               const SizedBox(height: 30,),
                Expanded(
                  child: GridView.count(
                    padding:const EdgeInsets.all(16),
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
              const  TextStyle(color: Colors.white,
                    fontSize: 35),textAlign: TextAlign.center,),
              const  SizedBox(height: 40,),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                  primary:  Theme.of(context).splashColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)
                    )
                  ),
                  icon:const Icon(Icons.replay),
                    onPressed: ()=>provider.repeatTheGame(),
                    label:const Text('Repeat the game',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
              const  SizedBox(height: 45,),

              ],
            ),
          ),
        );
      },
    );
  }
}

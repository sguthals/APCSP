#lang APCSP/lib
@declare-tags[]

@title{Unit 5: Snails, Loops, and Indexes}

@unit-overview/auto[#:lang-table (list (list "Number" @code{+ - * / sqr sqrt expt})
                                       (list "String" @code{string-append string-length})
                                       (list "Image"  @code{rectangle circle triangle ellipse star text scale rotate put-image}))]{
@unit-descr{Students define functions that map attributes of their game from one frame to the next, allowing them to move their dangers, targets, and projectiles.}
}

@unit-lessons{
@lesson/studteach[
     #:title "Introduction"
     #:duration "20 minutes"
     #:overview ""
     #:learning-objectives @itemlist[@item{Gain more experience understanding and correcting programming errors}]
     #:evidence-statements @itemlist[@item{Students will be able to read error messages for basic syntax errors}
                                     @item{Students will be able to edit programs to eliminate basic syntax errors}]
     #:product-outcomes @itemlist[@item{Use lists to organize and group objects together}                 ]
     #:standards (list "BS-PL.1" "BS-PL.2" "BS-PL.3" "BS-IDE")
     #:materials @itemlist[@item{Pens/pencils for the students, fresh whiteboard markers for teachers}
                            @item{Class poster (List of rules, language table, course calendar)}
                            @item{Language Table (see below)}
                            @item{Bug Hunting [Bugs.rkt from @resource-link[#:path "source-files.zip" #:label "source-files.zip"] | @(hyperlink "http://www.wescheme.org/view?publicId=JCTcwYc57r" "WeScheme")] file preloaded on students' machines, as the front-most window.}]
     #:preparation @itemlist[@item{Students are logged into WeScheme.org, OR have opened DrRacket.}
                            @item{Students are familiar with Alice 3 and have some understanding of objects}]
     #:prerequisites (list "Defining Functions")
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{Hi there! In this assignment, we are going to look at making another Alice world, except this one will introduce you to randomness, and how we can use lists of objects in our worlds to group similar items together. We’ll also introduce you to indexing, which is how we can access an individual object in a list. You’ll also see how a for each and counted loop work. You’ll also get to see how methods (procedures) can be used in Alice worlds to make object be modified, or do things, but also learn why we use methods in Computer Science, and how they can save us lots of time!  
                                @activity[#:forevidence (list "BS-IDE&1&2" "BS-PL.1&1&2" "BS-PL.2&1&1" "BS-PL.2&1&2" "BS-PL.3&1&3")]{
                                        First, get started by watching the video of what our Alice world will do, you can find it @(hyperlink "https://drive.google.com/open?id=0B8WPCstkZObFRXF0NC1EUTZVTHM" "here"). As you’re watching it, think about how parts of the video (what the objects are doing) are repetitive, and how maybe, they could be represented in loops. After doing so, fill out the table below:@bitmap{images/objectTable.png}
					                                                                                            }
                               }
                        @teacher{Make sure students interpret the video correctly, and have an understanding of objects.}
                      }
		@point{@student{Now that you’ve completed the table, and have some understanding of the objects and the flow of this Alice world, download the @(hyperlink "https://drive.google.com/file/d/0B8WPCstkZObFbU52bWlfcDMtdzQ/view" "starter file").
		You should see the following template when you open the file in Alice 3: @bitmap{images/introStartFileView.png}
		               }
	              }
		@point{@student{As you can see, this world doesn’t have much, only some snail objects and seaweed/bushes. In the myFirstMethod, the only method calls are camera movements, which are used to keep our snails in view.
		@bitmap{images/intro-myFirstView.png}
		               }
		      
		       @teacher{Make sure the student knows how to download off of drive webpages, to just click on the downward facing arrow in the top right hand corner.}
		      }
                  ]}

@lesson/studteach[
     #:title "Lists"
     #:duration "30 minutes"
     #:overview "Students learn more about lists, and how to create and initialize them in Alice 3."
     #:learning-objectives @itemlist[@item{Students learn the functionality of lists in Alice 3}]
     #:evidence-statements @itemlist[@item{Students will be introduced to indexing, which will be built upon in the following topics}
                                     @item{Students will learn how to initialize a List in Alice 3}]
     #:product-outcomes @itemlist[@item{Students will organize similar objects into lists, in order to modify them together}]
     #:exercises (list (make-exercise-locator/dr-assess "Danger-and-Target-Movement" "target-leap-design-recipe-assess" "Making Players Leap")
		       )
     #:standards (list "F-IF.1-3" "F-LE.5" "BS-DR.2" "BS-DR.3")
     #:materials @itemlist[@item{Computer for running Alice 3}
                            @item{Student @(resource-link #:path "workbook/StudentWorkbook.pdf" #:label "workbook")}
                            @item{All student computers should have their game templates pre-loaded, with their image files linked in}
                            @item{Class poster (List of rules, language table, course calendar)}
                            @item{Language Table (see below)}]
     #:preparation @itemlist[@item{}]
     #:prerequisites (list "")
     #:pacings (list 
                @pacing[#:type "remediation"]{}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
      


      @points[@point{@student{In computer science, objects can be organized or grouped into things called “lists” or “arrays”, so that they can be more easily modified. Let’s make a list of all the snails in the world, so that we can modify them all together. We do this by dragging the “variable…”  button from the very bottom of the window into the myFirstMethod body, right under the first statement, the call to Albert snail’s say procedure. The window that opens should look like:@bitmap{images/list1.png} }
                        @teacher{}
                    }
              @point{@student{Then, follow the following series of steps, to initialize a list of snails}
	             @teacher{}
		    }
                 @point{@student{@activity[#:forevidence (list "BS-DR.2&1&1" "BS-DR.2&1&3" "BS-DR.3&1&1" "A-SSE.1-2&1&1" "A-SSE.1-2&1&2" "F-LE.5&1&1" "7.EE.3-4&1&4" "F-IF.1-3&1&4")]{
                                          @itemlist[ @item{Since we’re going to create an array, check the box "is array"}
					              @item{Click on the value type selector, click on "Gallery Class …"}
                                                      @item{Click on slitherer, so that all the parent classes are selected also, as in the picture below:
 						            @bitmap{images/list2.png}
  						           }
                                                      @item{Hit ok, and the window should now look like:
						            @bitmap{images/list-3.png}
						      	   }
                                                      @item{Click on the text box next to name, and enter a name that will be used to refer to the array, such as "snail".}
                                                      @item{The last property to set is the initializer, so click on the red “unset” icon, and select "Custom Array …" and the following window should appear:
						            @bitmap{images/list-4.png}
							   }
						      @item{Click on add, and click on this.Napolean to add the Snail object named Napolean to the array. Keep doing this until all the snails are loaded into the area.
						      At this point your window should look something like:
						           }
					              @item{
						      @bitmap{images/list-5.png}
						           }	   
						      @item{ take a look at this window, because it can actually tell us a lot about the syntax of arrays, and how they can be referenced.
						           }
					          ]
                                         }
		                }
                         @teacher{}
                         }
                 @point{@student{ At the top of the window, the @bitmap{images/list-6.png}} @teacher{}
		 }
		 @point{@student{is the syntax for initializing an array of objects. The first part, @bitmap{images/list-7.png}} @teacher{}}
		 @point{@student{ tells Alice that we want to create an array of objects, of the type Slitherer, so we can group all of our snails together.
		                  This is what the @bitmap{images/list-8.png}}@teacher{}}
		 @point{@student{right below this line explains, that this array we’re creating holds Slitherers. The next part tells us the exact objects that are stored in this array: @bitmap{images/list-9.png}
				}                                
                         @teacher{Here, we introduce the visual perspective of arrays}
	                }
                 @point{@student{The image above tells us the exact objects that are stored in this array. 
The number in between the "[ ]" next to each object is called the "index". This index is what we can use to reference an object in an array. For example, suppose we wanted to access Bessie the snail in the array displayed above, the name we can use to refer to Bessie is snail[3]. Do you know why it can’t be Slitherer[3]? Because "Slitherer" only represents the type of object, whereas the name of the objects in the array is "snail", according to the window displayed after you hit "ok":@bitmap{images/list-10.png}
                                }
                                 @teacher{Here, you could review the idea of objects, and class name vs object name}
                         }
                 @point{@student{Hit ok on this window, and you should see the following in the body of your Alice world:@bitmap{images/list-11.png}} @teacher{}}
		 @point{@student{Next, we’re going to make a procedure that will make our group of snails move in a herd-like movement, each one moving a random amount.} @teacher{}}
     ]}





@lesson/studteach[
     #:title "Procedure 1: moveHerd"
     #:duration "1 hour"
     #:overview ""
     #:learning-objectives @itemlist[@item{Students learn to implement randomization to make objects within a list make slightly different movements}]
     #:evidence-statements @itemlist[@item{Students will be able to write procedures that use for each loops, while loops, and randomization}]
     #:product-outcomes @itemlist[@item{Students will implement and learn about for each loops}
                                  @item{Students will use while loops, that check a boolean expression}
				  @item{Students will be introduced to randomization, and how that can be applied to and used with lists to make objects behave differently}]
     #:standards (list "F-IF.1-3" "F-LE.5" "BS-DR.3")
     #:materials @itemlist[]
     #:preparation @itemlist[@item{Minimal understanding of boolean logic}]
     #:prerequisites (list "Brainstorming" "The Design Recipe")
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{@activity[#:forevidence (list "BS-DR.3&1&1" "A-SSE.1-2&1&1" "A-SSE.1-2&1&2" "7.EE.3-4&1&4" "F-IF.1-3&1&4")]{
                                          @itemlist[@item{click on the “Scene tab in the upper left corner, then click on the @bitmap{images/method1-1.png}}
					            @item{button right below the myFirstMethod method}
						    @item{After you do this, enter “moveHerd” as the name, and hit “ok”. Alice should now display a new, empty canvas to add methods and variables onto:
						         @bitmap{images/method1-2.png}}
                                                    @item{In order to make our snails move in a random order, we first need to access them. To do this, we can add what are called “parameters” to make the procedure we are working on reference and modify specific objects. To add a parameter to a method, click on "Add Parameter…", in the window that appears, notice how it looks very similar to how we added our snail array at the beginning of myFirstMethod. Add an array the same way you added the Snail array. Since you’re adding a parameter, you don’t need to initialize the array to anything, you don’t need to add the snail objects to it. Parameters tell Alice to take in an array of Snails, only, not take in a specific array of Snails. The parameter will act as a reference pointing to the array of snails, so the array of snails that is actually entered modified by calling methods on the method’s parameter array of snails. This sounds complicated, but it’s easier to understand once you finish implementing this method. Now, in order to give our method moveHerd more functionality, we add another parameter, a DecimalNumber, to specify exactly how far the herd of snails should move. 
Add this parameter the same way you added our first parameter, except instead, choose DecimalNumber as the type to add. The very top of your method, called the "method header" should now look like this:
    	 	       	    	    	      	    	 @bitmap{images/method1-3.png}}
                                                    @item{To make our group of snails move by only a certain amount, specified by our second parameter, we need another variable, declared within the body of this method, to keep track of how far our herd of snails moves, and limit how far the herd moves, by comparing how far they’ve moved at a given moment with the parameter value.
						    }
						    @item{Now that we have the method setup correctly, let’s start adding components to it
First, we start by adding a variable we can use to keep track of how far our herd of snails moves. Add a DecimalNumber to the body of the method called distanceTraveled, initialized to 0.}
       	  	   	    	     	    	    @item{The goal of this method is to make a groupd of snails move a certain distance, right. So in other words, we want them to move until a certain distance has been attained (distanceTraveled == distance). A while loop will allow us to have our snails do exactly this, move until a certain distance is met. Here’s the structure for a while loop:}
						    @item{
						    while(condition is true){
						    Do this..
	                                            ...
						    ...
						    }
						    @item{ A while loop will execute a body of statements over and over again, until a certain condition is no longer true. Think about how we can apply this to making our herd of snails move a certain distance. Try to come up with the pseudocode for it, it should be something like this:
						    }
						    @item{@italic{While distanceTravelled less than distance {
                                                                 Move turtles randomly one at a time
                                                                 Update distanceTravelled
                                                                 }
								 }
						         }
					            @item{pseudocode is meant to be easy to understand, so anything like the above is fine, we don’t need to put too much detail into it, we just need to understand how a while loop works, and how we can apply it to making our snails move random amounts together.}
						    @item{So, start by dragging a while loop onto the method body, and select “true” on the drop down menu.}
						    @item{Now, we need to add the condition to be checked each time before our herd moves, in order to make sure they don’t keep moving past the specified desired distance.}
						    @item{In order to do this, click on the button that says “true”, and select the following sequence of icons: @bitmap{images/method1-4.png}}
						    @item{First, we selected the Relational (DecimalNumber) icon because we want our while loop to check if one value is still less than another. This why we also selected "??? <= ???", and distanceTravelled, then distance, to represent the comparison distanceTravelled <= distance}
                                                        }]}}
                        @teacher{Make sure the student understands the concept of pseudocode, and how it's supposed to be closer to english than actual code, in order to represent the algorithm}
                         }
              @point{@student{Now, we need to fill in the part of our method that will make our snails move in a herd like fashion. First, in order to make each of our snails move a different, random amount, we need to add another variable to keep track of how far of a step each one should take. This will also allow us to update distanceTravelled accordingly, so that we don’t end up with an infinite loop (in which case our snails will never stop moving!).} @teacher{Make sure they understand what an infinite loop means, and how we can prevent these by remembering to update our counter}}
	      @point{@student{@activity[]{
	                      @itemlist[@item{So, add a new DecimalNumber variable, step, inside of the while loop we just made, and initialize it to 0.0. Next, let's think of how we want our snails to move. If they all moved at the same time, that wouldn't be very herd-like, right? In this case, we want to iterate through the array of snails, moving each one one at a time, updating the distanceTravelled after all the snails have taken a step. In order to iterate through the array, we’re going to use a for-each loop, or as Alice calls them, a "for each in " loop. Go ahead and drag one into our while loop, right underneath where the variable step is created. The window that appears will ask you to define the array that the for loop should iterate through. Start with assigning the item type. What is the type of the array that we're going to be iterating through? Slitherer! The same way you created the array parameter, click on Gallery class.... In the drop down menu and choose Slitherer. Now, in the original window, go to the red button next to "array:" and click on the value that corresponds to the parameter array name that we created in the very beginning of making this procedure (herd). The last thing you need to enter is a name. This name is not really that meanngful, it will only exist in the for loop, and is used to reference the snail in the array that the loop is pointing to in a given iteration. Go ahead and name it whatever you’d like, like even “snail”. Now hit ok, and if you did this correctly your moveHerd method should now look like this:}
			               @item{@bitmap{images/method1-5.png}}
				       @item{We want our snails to each move forward a random amount, so let’s do this by making our variable step store a random number in it (which will represent the amount a snail in the array should move forward in each iteration). Drag an assign tile from the bottom into our for loop, and select "step" in the drop down menu that appears.  In the last menu choose any number, it doesn’t matter, because we’re going to change it.}
				       @item{The assignment should look like this, but it will change soon:@bitmap{images/method1-6.png}}
				       @item{We want our snails to actually move, so we need to change the 0.0 to something else, and if we want each one to move a different amount, we should use random numbers. Due to the dimensions of our snails, it makes sense to make each one move a random amount between 1 and 2.5, being how long a step size is for one specific snail. In order to do this, click on the down arrow next the 0.0 in the assignment block, and select the following sequence of icons:}
				       @item{bitmap{images/method1-7.png}}
				       @item{After clicking on "Custom DecimalNumber...", enter 2.5, and you should now see this in the for loop:@bitmap{images/method1-8.png}}
				       @item{Now, we want to make our snails actually move, so we need to call the move procedure on them, and have them move forward by the random amount we just assigned to step. Do you know which Snail object we should call the move procedure on? Since we’re making our snails move inside the for-each loop, think about the variable that we defined in the for-each loop : snail. The variable "snail" in @bitmap{images/method1-9.png}}
				       @item{refers to a snail in the array referencing “herd”, the parameter defined in at the very beginning of the procedure. We can call the move procedure on this variable in order to refer to each member of the snail array, one at a time. Click on the drop down menu of objects, and click on “snail” at the very bottom:
				       @bitmap{images/method1-10.png}
				       }
				       @item{Now that you have that snail reference selected, drag the move procedure to be right underneath the random assignment of step in the for loop of our procedure. In the drop down menus, select FORWARD, and then “step” for the length of how far the snail object should move forward. Now, your entire method should look like this:
				       @bitmap{images/method1-11.png}
				       }
				       @item{This looks like it should work, right? But wait, when will our while loop end? Never, because distanceTravelled is never updated. This will cause our snails to never stop moving, so we need to add another assignment line changing the value of distanceTravelled after every snail has taken a step. You can do this by dragging another assign tile out, but instead putting it inside the for loop like the last assignment we did, we put it right outside this for loop, but still inside while loop. We put this outside the for loop, because we want this variable to update after every snail has taken one step, so that all the snails move together. The procedure should now look like this, with some arbitrary value (which we will change soon) being assigned to distanceTravelled:}
				       @item{@bitmap{images/method1-12.png}}
				       @item{Click on the 0.5 and select distanceTravelled, so now the assignment looks like:@bitmap{images/method1-13.png}}
				       @item{This looks weird, right? Why are we assigning distanceTravelled to itself? Our goal is to update distanceTravelled everytime the for loop has been completed (every snail has taken a step). To update  the value means to keep track of the value of distanceTravelled before every snail took a step, and only add on to it the distance (approximately) that the snails just moved. In order to fully implement this, click on distanceTravelled to the right of the arrow and select the following sequence of buttons: }  
			               @item{@bitmap{images/method1-14.png}}
				       @item{All in all, the statement should look like:
				       @bitmap{images/method1-15.png}
				       }
				       @item{The reason we’re adding step is to increment distanceTravelled by (approximately) the amount that the snails all moved forward in the step taken.}
				       @item{Next, we need to call this procedure we just made in our myFirstMethod in order to make our snails actually move.}
				       @item{Navigate back to myFirstMethod, and make sure “this” is selected in the object selection drop down menu. You should see our moveHerd procedure displayed in the purple area on the left:}
				       @item{@bitmap{images/method1-16.png}}
				       @item{Drag a moveHerd block into our myFirstMethod right in between these 2 procedure calls:
				       @bitmap{images/method1-17.png}}
				       @item{select snail in the first drop down menu that appears, in order to set the array of snails that we created as the argument in our procedure. In the next drop down menu that appears, select any arbitrary value, since we’re going to change that right now. Now, go to the object selection menu, and select "this.Albert", since Albert is the farthest ahead in the pack of snails.}
				       @item{ Now, click on the "functions" tab, and drag a @bitmap{images/method1-18.png}  out into the procedure call that we just made, into the square next to the distance parameter, and select “this.seaweed” as the object to get distance to, so now your entire procedure call should look like: @bitmap{images/method1-19.png}}
				       @item{ Why did we need to add the this.Albert.getDistanceTo(this.seaweed)? Because the distance parameter controls how far our snails should move as a herd. Since we want them to move up until the seaweed, we can reference the first Snail in our array, and find the distance from him to the seaweed, and set that as far as we want the herd to move together. If you run the world right now, you’ll see something, weird though. Our snails end up crashing into the seaweed. In order to fix this, we have to make them travel less distance, but still relative to Albert’s distance to the seaweed. Modify our distance argument so that our herd will move forward until about 5 feet/distance units from the seaweed, so our procedure call should look like:
				       @bitmap{images/method1-20.png}}
				       @item{And our entire myFirstMethod should now look like:
				       @bitmap{images/method1-21.png}}
				       @item{Next, we create another procedure, to make our snails eat the food they’ve now encountered. }]}}
				       @teacher{ If you run the program, you’ll see that our snails move in a herd like fashion, but they move pretty slow for EC, figure out how to make them move faster}
				   }
				   ]
				   }






@lesson/studteach[
     #:title "Topic: Arrays and Indexing"
     #:duration "15 minutes"
     #:overview ""
     #:learning-objectives @itemlist[]
     #:evidence-statements @itemlist[]
     #:product-outcomes @itemlist[
				  @item{Student learns more about indexing within an array, in order to move onward to making the next proceudure}]
     #:standards (list)
     #:materials @itemlist[]
     #:preparation @itemlist[]
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{Congratulations - you've got the beginnings of a working game! However, several things remain unfinished:
                                @itemlist[@item{Before we can move on to creating our next (and final) procedure, we need to understand how indexing arrays works. An array is an ordered series of items, of the same type. Below is an example of an array of 6 integer variables, called numbers:
				@bitmap{images/topic-1.png}}
				          @item{This is how the variables are grouped together into an array, and we can reference the entire array using the name numbers. You’re probably wondering how we can reference a specific cell in the array, like how do we reference the cell that says 7 in the above array? Well, in computers, arrays are numbered, so each item in an array has a number, an index associated with it, so the above array can be visualized more as:
					  @bitmap{images/topic-2.png}}
					  @item{If we want to access the 4th cell in the array (the cell that has a 7), we can use its index to do so, by refering to numbers[3], where 3 is the index associated with that item in the array. Notice how the indexes start at 0, so the last index will always be 
(array length - 1).} ]
                                }
                        @teacher{@itemlist[@item{Students may have questions on why this important, remind them that these concepts will be applied in the next section.}
                                            
                                            ]}
                        }]
         
}]






@lesson/studteach[
     #:title "Procedure 2: eatFood"
     #:duration "1 hour"
     #:overview ""
     #:learning-objectives @itemlist[]
     #:evidence-statements @itemlist[]
     #:product-outcomes @itemlist[@item{Student applies indexing to making a program that uses lists, modifying each member in the list according to their index, via if statements} ]
     #:standards (list)
     #:materials @itemlist[]
     #:preparation @itemlist[]
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{@activity[]{
                                @itemlist[@item{First, create a new Scene procedure the same way you made our moveHerd procedure. Then initialize the following variables inside the procedure, following the steps we did in our moveHerd procedure :
						       @bitmap{images/method2-1.png}}
				          @item{"Slith" is just another array reference made in order to access the snails in our world. Next, we make a new array of type Prop, used to refer to the 3 seaweed objects in front of our snails. We make the same type array in order to reference the 3 bushes in front of the snails. The next 3 variables are used as something called "indices", which we use to access each of objects in the arrays, and modify them accordingly. Next, we need to add a while loop, to loop through our arrays of objects, in order to modify them add the following while statement:
					  		@bitmap{images/method2-2.png}}
					  @item{This means that every line of code that is contained within the box underneath this while statement will be executed again and again until slitherCount is 6.0. We will use slitherCount to access our snails, similar to how we accessed them using the for each loop, except this time, we’ll be using indexing, where slitherCount will be the index. Before we get into that though, we need to understand how arrays are represented. 
Now, fill out the following chart, by representing our array of snails that we created in this method (slith) in a fashion similar as the numbers array}
     	      	  	    	          @item{@bitmap{images/method2-3.png}
					        @bitmap{images/method2-4.png}}
				          @item{Let’s move on to actually implementing our while loop, to have it actually do something. When referencing specific items in an array, such our snails in slith, Alice prefers that we first store the reference to the specific item from the array into variable. In order to do this, we drag another variable rectangle out into our while loop. Set the value type to be Slitherer, since we’re going to be referencing a Snail, which is of type Slitherer. You can name this variable whatever you’d like, all that really matters is our inititializer. Clicking on the red button next to the initializer field should display:
					  @bitmap{images/method2-5.png}}
					  @item{Select slith (the array that holds all the snails we we want to reference). In the next drop down menu, Alice is asking you which snail in slith you want to access, specifically what index of the array of Snails you want to access. Remember how we said slitherCount was going to be used to index our array? So select that as the index of slith that we want Alice to access.
					  @bitmap{images/method2-6.png}}
					  @item{All in all, this should equate to the following line of code:
					      @bitmap{images/method2-7.png}}
					    ]}}
                        @teacher{}
                        }
	   @point{@student{@itemlist[@item{Now that we know how to index our snails, we can make them do interesting things using the while loop. Looking at the video, notice how half of the snails ate the seaweed, and the other half ate the bushes. In order to make half the snails do something, we can just have our while loop do something for the even indexed snail, and something else for odd indexed snails. The important thing to remember is that after we modify a given snail in that iteration of the while loop, we need to increment the variable that we’re using as the index- slitherCount. If we don’t, the index accessed will always be 0, and since our while loop will execute the code while slitherCount is less than 6, our loop will never end, and we’ll end up with an infinite loop. Back to deciding how to implement our while loop, we need to add a structure inside our loop that checks whether or not slitherCount is even, and if it is make the snail referenced in this iteration eat a bush, else eat the seaweed. Can you tell what kind of statement we need? An if-else statement! Add one inside our loop. Select “true” in the drop down menu. We want to make our if statement check if slitherCount is even, right? In other words, we want it to check if the remainder when slitherCount is divided by 2 is 0. So, we want our if statement condition to look like this:
	   				       @bitmap{images/method2-8.png}}
				   ]}}
	   @point{@student{@activity[]{@itemlist[
					@item{You can add this by clicking on the “true”, and then the following sequence:
					@bitmap{images/method2-9.png}}
					@item{Why this? First, we need to think about what we want condition to be true in order for the if statement body to be executed: we want the remainder when slitherCount is divided by 2 to be equal to zero which is why we want to use == 0 as the outermost argument in the if statement condition. In order to set the rest of the condition, drag a slitherCount tile from its declaration square into the left '0', and click on the tile that now that say "slitherCount" in the if statement condition, select the following sequence:
					@bitmap{images/method2-10.png}}
					@item{Your condition should now look like:
					@bitmap{images/method2-11.png}}
					@item{For even indexed snails we want the snail to turn to face a bush, move forward to it, and have the bush vanish, making the appearance that the snail ate the bush. Implement the following lines inside this if statement in order to make this happen:
					@bitmap{images/method2-12.png}}
					@item{In the first line, we add a new variable in the iff statement used to refer to a specific bush in the bush array we created earlier in this method. This will allow us to make this bush eventually vanish. sl.turnToFace(bush[bushCounter]). Tells Alice to make the snail referenced in the current iteration to turn to face the bush it will eventually eat (Hint: To add this line, go to the object selection menu, and select sl, and call turnToFace). The next line moves the snail referenced in the current iteration to the bush, and bsh.setOpacity(0.0) makes the bush vanish. The last line, bushCounter = bushCounter + 1 tells Alice to increment our bushCounter, so that the next time an even index is encountered, the next bush will be the one modified.}
					@item{Next, we need to tell Alice what to do whenever an odd indexed snail is encountered, pretty much the same thing as what it does with the even ones, the only difference being that seaweed is modified, not the bushes, be sure to put these in the else statement:
					@bitmap{images/method2-13.png}}
					@item{Now that you’ve completed this last part of our if-else statement, you need to add one more line inside our while loop but outside our if statement. The increment-slitherCount statement. If we forgot this, our procedure would never end! So, add this final line:
					@bitmap{images/method2-14.png}}
					@item{Our entire method for eatFood is over! It should look like this:
					@bitmap{images/method2-15.png}}
					@item{Now, get back to our myFirstMethod, and call this method the same way you called moveHerd, and place it as the very last line, and our world is done! Now, make another procedure, celebrate, that makes each snail celebrate having eaten, by either saying or doing something (such as dancing).} ] }}
		@teacher{@itemlist[@item{A possible question to ask is, what would happen to our program if we left the statement that incremented our bushCounter variable outside the if statement (but still in the while loop)}
			           @item{ Award EC pts based on how complex their procedure is, such as whether they used a for each loop or instead indexing (which is considerably more complex), and what they made their snail do.}]}
				   
		


}
]
}
]
}
         
    
	  
	      

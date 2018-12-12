titanic_df <- data.frame(titanic3)
str(titanic_df)


#Find and replace NA and blanks in Embarked
titanic_df %>% group_by(embarked) %>% 
  count(embarked)

for(i in 1:length(titanic_df$embarked)){
  if(is.na(titanic_df$embarked[i]) == TRUE) {
    titanic_df$embarked[i] <- "S"
  } else {
    titanic_df$embarked[i] <- titanic_df$embarked[i]
  }
}

#Changing missing Age to the average age
titanic_df %>% group_by(age) %>% 
  count(age)

for(i in 1:length(titanic_df$age)) {
  if(is.na(titanic_df$age[i]) == TRUE) {
    titanic_df$age[i] <- mean(titanic_df$age, na.rm = TRUE)
  }
}

#Change missing Lifeboat to "None"
for(i in 1:length(titanic_df$boat)) {
  if(is.na(titanic_df$boat[i]) == TRUE) {
    titanic_df$boat[i] <- "None"
  }
}

#Create new variable has_cabin_number
for(i in 1:length(titanic_df$cabin)) {
  if(is.na(titanic_df$cabin[i]) == TRUE) {
    titanic_df$has_cabin_number[i] <- 0
  } else {
    titanic_df$has_cabin_number[i] <- 1
  }
}

#Save data
write.csv(titanic_df, file = "titanic_clean.csv")
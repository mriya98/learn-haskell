-- Matches pattern from top to bottom, ORDER IS IMPORTANT!
-- kind of like "case" in imperative languages
lucky:: (Integral a) => a -> String
lucky 7 = "Lucky Number 7"
-- catch-all is a must to avoid having non-exhaustive patterns
lucky x = "Sorry, you're out of luck!"

-- Pattern offers a way to write recursive functions
factorial:: (Integral a) => a -> a
factorial 0 = 1
factorial x = x * factorial(x-1)

-- Helps write equations in more intuitive and readable form
addVectors:: (Num a) => (a,a) -> (a,a) -> (a,a)
addVectors (x1, y1) (x2,y2) = (x1 + x2, y1 + y2)

-- Without patterns, it would look like this
addVectorsNoPat:: (Num a) => (a,a) -> (a,a) -> (a,a)
addVectorsNoPat a b = (fst a + fst b, snd a + snd b)

-- Pattern matching in lists, custom head function
head':: [a] -> a
head' [] = error "Cannot get head of an empty list"
head' (x:_) = x

tell :: (Show a) => [a] -> String
tell [] = "This is an empty list"
tell (x:[]) = "This list has one element: " ++ show x
tell (x:y:[]) = "This list has two elements" ++ show x ++ " and " ++ show y
tell (x:y:_) = "This list has many elements"

-- You can also add reference to the whole thing after you have broken it into patterns
capital :: String -> String  
capital "" = "Empty string"  
capital all@(x:xs) = "The first letter of " ++ all ++ " is " ++ [x]
-- Here, all is binded to the pattern (x:xs), and can be used to represent the whole string
-- For example, when calling function like this - capital "Pokemon",
-- The pattern is broken down as (x:xs) -> (P:okemon), "all" refers to "Pokemon"

-- GUARDS

-- Useful when the pattern you want to match require comparison or True-False checks
densityTell :: (RealFloat a) => a -> a -> String  
densityTell mass volume  
    | mass / volume < 1.2 = "Density less than 1.2"  
    | mass / volume <= 1000.0 = "Density >=1.2 but <= 1000"  
    | otherwise   = "Catches everything else"


-- It is also possible to use where clause to define several names and functions like this:
densityAnalysis :: (RealFloat a) => a -> a -> String  
densityAnalysis mass volume  
    | density < air = "Density less than 1.2"  
    | density <= water = "Density >=1.2 but <= 1000"  
    | otherwise   = "Catches everything else"
    where density = mass / volume
          air = 1.2
          water = 1000.0

-- Another use case, takes in list of (mass, vol) pairs and returns list of densities
-- where clause can define a function as well
calcDensities :: (RealFloat a) => [(a, a)] -> [a]
calcDensities mv = [density m v | (m, v) <- mv]
    where density mass volume = mass / volume

-- Let bindings
cylinderArea :: (RealFloat a) => a -> a -> a  
cylinderArea r h = 
    let sideArea = 2 * pi * r * h  
        topArea = pi * r ^2  
    in  sideArea + 2 * topArea

-- Let bindings can be inline too
calcDensitiesLet xs = [density | (m, v) <- xs, let density = m / v]  

-- Cases
describeList :: [a] -> String  
describeList xs = "The list is " ++ case xs of [] -> "empty."
                                               [x] -> "a singleton list."
                                               xs -> "a longer list."
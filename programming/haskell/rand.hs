-- GENERATING RANDOM NUMBERS

import Data.List
import System.Random

-- some definitions

-- auxillary function
randomlist :: Int -> StdGen -> [Float]
randomlist n = take n . unfoldr (Just . random)

-- generate a list of floats
randfs :: Int -> IO [Float]
randfs n = do
  seed  <- newStdGen
  return $ randomlist n seed

-- example usage
main = do
  rands <- randfs 10
  print rands
  print $ sum rands


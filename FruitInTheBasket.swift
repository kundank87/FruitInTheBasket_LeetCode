//
//  FruitInTheBasket.swift
//  FruitInTheBasket
//
//  Created by Kundan Kumar on 08/02/26.
//

import SwiftUI

    func totalFruit(_ fruits: [Int]) -> Int {
        // A dictionary (acting as a frequency map or "baskets") to store the count of each fruit type in the current window.
        var basket = [Int: Int]()
        
        // The left pointer of the sliding window.
        var leftPointer = 0
        
        // The maximum number of fruits collected so far.
        var maxFruits = 0
        
        // Iterate through the array with a right pointer.
        for rightPointer in 0..<fruits.count {
            let currentFruit = fruits[rightPointer]
            // Add the current fruit to the basket (frequency map).
            basket[currentFruit, default: 0] += 1
            
            // If the number of fruit types in the basket exceeds 2, shrink the window from the left.
            while basket.keys.count > 2 {
                let leftFruit = fruits[leftPointer]
                basket[leftFruit]? -= 1
                
                // If the count of the left fruit becomes zero, remove it from the basket.
                if basket[leftFruit] == 0 {
                    basket[leftFruit] = nil
                }
                
                // Move the left pointer forward.
                leftPointer += 1
            }
            
            // Update the maximum number of fruits collected. The window size is (rightPointer - leftPointer + 1).
            maxFruits = max(maxFruits, rightPointer - leftPointer + 1)
        }
        
        return maxFruits
    }

struct FruitInTheBasket: View {

    var body: some View {
        let fruits1 = [1, 2, 1]
        Text("Maximum fruits for [1, 2, 1]: \(totalFruit(fruits1))") // Output: 3

        let fruits2 = [0, 1, 2, 2]
        Text("Maximum fruits for [0, 1, 2, 2]: \(totalFruit(fruits2))") // Output: 3

        let fruits3 = [1, 2, 3, 2, 2]
        Text("Maximum fruits for [1, 2, 3, 2, 2]: \(totalFruit(fruits3))") // Output: 4
    }
}

#Preview {
    FruitInTheBasket()
}

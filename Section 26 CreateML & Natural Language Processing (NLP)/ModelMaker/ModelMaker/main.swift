//
//  main.swift
//  ModelMaker
//
//  Created by malakoipechyva on 11.01.21.
//

import Foundation

import CreateML

let data = try MLDataTable(contentsOf: URL(fileURLWithPath: "/Users/malakoipechyva/Downloads/twitter-sanders-apple3.csv"))
let(trainingData, testingData) = data.randomSplit(by: 0.8, seed: 5)
let sentimentClassifier = try MLTextClassifier(trainingData: trainingData, textColumn: "text", labelColumn: "class")
let evaluationMetrics = sentimentClassifier.evaluation(on: testingData, textColumn: "text", labelColumn: "class")
let evaluationAccuracy = (1.0 - evaluationMetrics.classificationError)
let metadata = MLModelMetadata(author: "Yauhen", shortDescription: "A model trained to classify sentiment on Tweets", version: "0.1")
try sentimentClassifier.write(to: URL(fileURLWithPath: "/Users/malakoipechyva/Downloads/TweetSentimentClassifier.mlmodel"))

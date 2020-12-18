import tensorflow as tf
# ImageDataGenerator wird für Aufbereitung der Bilder benötigt
from tensorflow.keras.preprocessing.image import ImageDataGenerator

tf.__version__

# Prüfen ob eine GPU verfügbar ist
print("Num GPUs Available: ", len(tf.config.experimental.list_physical_devices('GPU')))

# Default Laufwerk definieren
import os
os.chdir('D:\\GithubReps\my_datascience\\udemy\mlaz\\Part 8 - Deep Learning\\')
print(os.getcwd())

train_datagen = ImageDataGenerator( #Wir erstellen eine Funktion mit IDG
        # Die Pixelwerte jedes einzelnen Bilds wird durch 255 geteilt bzw. zwischen 0 und 1 skaliert.
        rescale=1./255,  
        # Die nachfolgenden Attribute haben mit der Image Augmentation zu tun.
        shear_range=0.2, # Verzehrt die Bilder
        zoom_range=0.2, # Zoomed in die Bilder
        horizontal_flip=True) # Dreht Bilder

# Diese Klasse verbindet train_datagen mit dem Datensatz.
training_set = train_datagen.flow_from_directory( 
        'Section 40 - Convolutional Neural Networks (CNN)/Python/dataset/training_set',
        target_size=(64, 64), # Grösse der Bilder welche ins CNN gefeedet werden
        batch_size=32,
        class_mode='binary') # Wir haben nur zwei Werte Dog oder Cat

test_datagen = ImageDataGenerator(rescale=1./255)
test_set = test_datagen.flow_from_directory(
        'Section 40 - Convolutional Neural Networks (CNN)/Python/dataset/test_set',
        target_size=(64, 64),
        batch_size=32,
        class_mode='binary')

cnn = tf.keras.models.Sequential()

cnn.add(tf.keras.layers.Conv2D(
    filters=32, # Output Filters im CNN bzw. Anzhal Feature Detectors
    kernel_size=3, # Hier definieren wir die Grösse des Feature Detectors 3x3
    activation='relu', # Wie auch bereits im KNN verwenden wir auch hier ReLu
    # Input Format wie oben spezifiziert. Da es sich um Farbfotos handelt definieren wir 3 (RGB)
    # bei Schwarz-Weiss Fotos wären es 1
    input_shape=[64,64,3])) 

cnn.add(tf.keras.layers.MaxPool2D(
    pool_size=2, # Die Pooling Grösse ist 2 x 2
    strides=2)) # Hier definieren wir wieviel Slides das Pooling-Frame nach rechts macht.

cnn.add(tf.keras.layers.Conv2D(filters=32, kernel_size=3,activation='relu'))
cnn.add(tf.keras.layers.MaxPool2D(pool_size=2, strides=2))

cnn.add(tf.keras.layers.Flatten())

cnn.add(tf.keras.layers.Dense(
    units=128, # Da wir eine Input Shape von 64x64 haben nehmen wir 128 
    activation='relu'))

cnn.add(tf.keras.layers.Dense(
    units=1, # In einem Binary Classifier benötigen wir nur ein Output
    activation='sigmoid'))

cnn.compile(optimizer = 'adam', loss = 'binary_crossentropy', metrics=['accuracy'])

cnn.fit(
    x = training_set, 
    validation_data=test_set, 
    epochs = 25)

import numpy as np
from tensorflow.keras.preprocessing import image
test_image = image.load_img('Section 40 - Convolutional Neural Networks (CNN)/Python/dataset/single_prediction/cat_or_dog_1.jpg', target_size=(64,64))
test_image = image.img_to_array(test_image) # Hier wandeln wir das Bild in einen Array um
test_image = np.expand_dims(test_image, axis=0) # Wir müssen das Image noch in die richtige Dimension bringen.
result = cnn.predict(test_image)
training_set.class_indices 
if result[0][0] == 1:
  prediction = 'dog'
else:
  prediction = 'cat'

print(prediction)

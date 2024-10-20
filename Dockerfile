# Step 1: Use the official Jupyter Docker image as the base image
FROM jupyter/scipy-notebook:latest

# Step 2: Set the working directory inside the container
WORKDIR /home/jovyan/work

# Step 3: Copy the notebook and requirements.txt (if available) to the container
COPY all-in-one.ipynb /home/jovyan/work/
COPY requirements.txt /home/jovyan/work/requirements.txt

# Step 4: Install any Python dependencies if a requirements.txt file exists
RUN pip install --no-cache-dir -r requirements.txt || echo "No requirements.txt found, skipping installation."

# Step 5: Expose the port Jupyter uses
EXPOSE 8888

# Step 6: Start Jupyter Notebook server
CMD ["start-notebook.sh", "--NotebookApp.token=''", "--NotebookApp.password=''"]

namespace CSharpBasico.Dia6
{
    partial class FormularioDia6
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.btnLlamada1 = new System.Windows.Forms.Button();
            this.gridAnimales = new System.Windows.Forms.DataGridView();
            this.tbxAnimalId = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.tbxTipo = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.tbxNombre = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.cbxPedigri = new System.Windows.Forms.CheckBox();
            this.label5 = new System.Windows.Forms.Label();
            this.btnAgregar = new System.Windows.Forms.Button();
            this.tbxColor = new System.Windows.Forms.TextBox();
            ((System.ComponentModel.ISupportInitialize)(this.gridAnimales)).BeginInit();
            this.SuspendLayout();
            // 
            // btnLlamada1
            // 
            this.btnLlamada1.Location = new System.Drawing.Point(668, 38);
            this.btnLlamada1.Name = "btnLlamada1";
            this.btnLlamada1.Size = new System.Drawing.Size(75, 23);
            this.btnLlamada1.TabIndex = 0;
            this.btnLlamada1.Text = "Llamada1";
            this.btnLlamada1.UseVisualStyleBackColor = true;
            this.btnLlamada1.Click += new System.EventHandler(this.btnLlamada1_Click);
            // 
            // gridAnimales
            // 
            this.gridAnimales.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.gridAnimales.Location = new System.Drawing.Point(33, 387);
            this.gridAnimales.Name = "gridAnimales";
            this.gridAnimales.Size = new System.Drawing.Size(720, 150);
            this.gridAnimales.TabIndex = 9999;
            // 
            // tbxAnimalId
            // 
            this.tbxAnimalId.Location = new System.Drawing.Point(123, 43);
            this.tbxAnimalId.Name = "tbxAnimalId";
            this.tbxAnimalId.Size = new System.Drawing.Size(100, 20);
            this.tbxAnimalId.TabIndex = 1;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(30, 43);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(52, 13);
            this.label1.TabIndex = 4;
            this.label1.Text = "AnimalID:";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(30, 85);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(28, 13);
            this.label2.TabIndex = 6;
            this.label2.Text = "Tipo";
            // 
            // tbxTipo
            // 
            this.tbxTipo.Location = new System.Drawing.Point(123, 85);
            this.tbxTipo.Name = "tbxTipo";
            this.tbxTipo.Size = new System.Drawing.Size(100, 20);
            this.tbxTipo.TabIndex = 2;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(30, 136);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(44, 13);
            this.label3.TabIndex = 8;
            this.label3.Text = "Nombre";
            // 
            // tbxNombre
            // 
            this.tbxNombre.Location = new System.Drawing.Point(123, 136);
            this.tbxNombre.Name = "tbxNombre";
            this.tbxNombre.Size = new System.Drawing.Size(100, 20);
            this.tbxNombre.TabIndex = 3;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(30, 186);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(31, 13);
            this.label4.TabIndex = 10;
            this.label4.Text = "Color";
            // 
            // cbxPedigri
            // 
            this.cbxPedigri.AutoSize = true;
            this.cbxPedigri.Location = new System.Drawing.Point(123, 241);
            this.cbxPedigri.Name = "cbxPedigri";
            this.cbxPedigri.Size = new System.Drawing.Size(64, 17);
            this.cbxPedigri.TabIndex = 5;
            this.cbxPedigri.Text = "Verificar";
            this.cbxPedigri.UseVisualStyleBackColor = true;
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(30, 241);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(39, 13);
            this.label5.TabIndex = 12;
            this.label5.Text = "Pedigri";
            // 
            // btnAgregar
            // 
            this.btnAgregar.Location = new System.Drawing.Point(304, 233);
            this.btnAgregar.Name = "btnAgregar";
            this.btnAgregar.Size = new System.Drawing.Size(75, 23);
            this.btnAgregar.TabIndex = 6;
            this.btnAgregar.Text = "Agregar";
            this.btnAgregar.UseVisualStyleBackColor = true;
            this.btnAgregar.Click += new System.EventHandler(this.btnAgregar_Click);
            // 
            // tbxColor
            // 
            this.tbxColor.Location = new System.Drawing.Point(123, 179);
            this.tbxColor.Name = "tbxColor";
            this.tbxColor.Size = new System.Drawing.Size(100, 20);
            this.tbxColor.TabIndex = 4;
            // 
            // FormularioDia6
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 549);
            this.Controls.Add(this.tbxColor);
            this.Controls.Add(this.btnAgregar);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.cbxPedigri);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.tbxNombre);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.tbxTipo);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.tbxAnimalId);
            this.Controls.Add(this.gridAnimales);
            this.Controls.Add(this.btnLlamada1);
            this.Name = "FormularioDia6";
            this.Text = "FormularioDia6";
            ((System.ComponentModel.ISupportInitialize)(this.gridAnimales)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btnLlamada1;
        private System.Windows.Forms.DataGridView gridAnimales;
        private System.Windows.Forms.TextBox tbxAnimalId;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox tbxTipo;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox tbxNombre;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.CheckBox cbxPedigri;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Button btnAgregar;
        private System.Windows.Forms.TextBox tbxColor;
    }
}
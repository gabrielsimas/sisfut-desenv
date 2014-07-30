// -----------------------------------------------------------------------
// <copyright file="Estadio.cs" company="CS Services Consultoria em Sistemas">
// TODO: Update copyright text.
// </copyright>
// -----------------------------------------------------------------------

namespace Camada.Entidade
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;
    using System.Reflection;

    /// <summary>
    /// Entidade Estadio
    /// </summary>
    public class Estadio
    {
        #region Atributos

        private Nullable<long> id;
        private String nomeDono;
        private String nomeCompleto;
        private String apelido;
        private Nullable<DateTime> dataInauguracao;
        private Double gramadoCumprimento;
        private Double gramadoLargura;
        private Nullable<int> capacidade;
        private String cidade;
        private String estado;
        private IList<Clube> clubesMandantes;
        private IList<Confronto> jogos;
        #endregion

        #region Construtores
        public Estadio()
        {

        }

        public Estadio(Nullable<long> id,String nomeDono, String nomeCompleto, String apelido, Nullable<DateTime> dataInauguracao, Double gramadoCumprimento, Double gramadoLargura, Nullable<int> capacidade, String cidade, String estado, IList<Clube> clubesMandante, IList<Confronto> jogos)
        {
            this.id = id;
            this.nomeDono = nomeDono;
            this.nomeCompleto = nomeCompleto;
            this.apelido = apelido;
            this.dataInauguracao = dataInauguracao;
            this.gramadoCumprimento = gramadoCumprimento;
            this.gramadoLargura = gramadoLargura;
            this.capacidade = capacidade;
            this.cidade = cidade;
            this.estado = estado;
            this.clubesMandantes = clubesMandante;
            this.jogos = jogos;
        }
        #endregion

        #region Propriedades

        public virtual Nullable<long> Id
        {
            get
            {
                return this.id;
            }

            set
            {
                this.id = value;
            }
        }

        public virtual String NomeDono
        {
            get
            {
                return this.nomeDono;
            }

            set
            {
                this.nomeDono = value;
            }
        }

        public virtual String NomeCompleto
        {
            get
            {
                return this.NomeCompleto;
            }

            set
            {
                this.nomeCompleto = value;
            }
        }

        public virtual String Apelido
        {
            get
            {
                return this.apelido;
            }

            set
            {
                this.apelido = value;
            }
        }

        public virtual Nullable<DateTime> DataInauguracao
        {
            get
            {
                return this.dataInauguracao;
            }

            set
            {
                this.dataInauguracao = value;
            }
        }

        public virtual Double GramadoCumprimento
        {
            get
            {
                return this.gramadoCumprimento;
            }

            set
            {
                this.gramadoCumprimento = value;
            }
        }

        public virtual Double GramadoLargura
        {
            get
            {
                return this.gramadoLargura;
            }

            set
            {
                this.gramadoLargura = value;
            }
        }

        public virtual Nullable<int> Capacidade
        {
            get
            {
                return this.capacidade;
            }

            set
            {
                this.capacidade = value;
            }
        }

        public virtual String Cidade
        {
            get
            {
                return this.cidade;
            }

            set
            {
                this.cidade = value;
            }
        }

        public virtual String Estado
        {
            get
            {
                return this.estado;
            }

            set
            {
                this.estado = value;
            }
        }

        public virtual IList<Clube> ClubesMandantes
        {
            get
            {
                return this.clubesMandantes;
            }

            set
            {
                this.clubesMandantes = value;
            }
        }

        public virtual IList<Confronto> Jogos
        {
            get
            {
                return this.jogos;
            }

            set
            {
                this.jogos = value;
            }
        }
        #endregion

        #region Classe Rica

        public override bool Equals(object obj)
        {
            if (obj is Estadio)
            {
                Estadio objeto = (Estadio)obj;

                if (objeto.Id != null && this.id != null)
                {
                    return objeto.Id.Equals(this.id);
                }
            }

            return false;
        }

        public override string ToString()
        {
            FieldInfo[] atributos;
            atributos = GetType().GetFields(BindingFlags.NonPublic);
            return atributos.ToString();
        }

        public override int GetHashCode()
        {
            return this.id.HasValue ? this.id.GetHashCode() : 0;
        }

        #endregion

    }
}

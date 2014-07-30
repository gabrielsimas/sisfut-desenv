namespace Camada.Entidade
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;
    using System.Reflection;

    /// <summary>
    // Entidade Rodada
    /// </summary>
    public class Rodada
    {
        #region Atributos
        private Nullable<long> id;
        private Nullable<int> nroRodada;
        private String nomeRodada;
        private Nullable<DateTime> dataRodada;
        private Nullable<int> nroJogos;
        private FaseCampeonato fase;
        private IList<Confronto> jogos;
        #endregion

        #region Construtores

        public Rodada()
        {

        }

        public Rodada(Nullable<long> id, Nullable<int> nroRodada, String nomeRodada, Nullable<DateTime> dataRodada, Nullable<int> nroJogos, FaseCampeonato fase, IList<Confronto> jogos)
        {
            this.id = id.Value;
            this.nroRodada = nroRodada.Value;
            this.nomeRodada = nomeRodada;
            this.dataRodada = dataRodada.Value;
            this.nroJogos = nroJogos.Value;
            this.fase = fase;
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

        public virtual Nullable<int> NroRodada
        {
            get
            {
                return this.nroRodada.Value;
            }

            set
            {
                this.nroRodada = value;
            }
        }

        public virtual String NomeRodada
        {
            get
            {
                return this.nomeRodada;
            }

            set
            {
                this.nomeRodada = value;
            }
        }

        public virtual Nullable<DateTime> DataRodada
        {
            get
            {
                return this.dataRodada.Value;
            }

            set
            {
                this.dataRodada = value;
            }
        }

        public virtual Nullable<int> NroJogos
        {
            get
            {
                return this.nroJogos.Value;
            }

            set
            {
                this.nroJogos = value;
            }
        }

        public virtual FaseCampeonato Fase
        {
            get
            {
                return this.fase;
            }

            set
            {
                this.fase = value;
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
            if (obj is Rodada)
            {
                Campeonato objeto = (Campeonato)obj;

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

namespace Camada.Entidade
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;
    using System.Reflection;

    /// <summary>
    /// Entidade FaseCampeonato
    /// </summary>
    public class FaseCampeonato
    {
        #region Atributos
        private Nullable<long> id;
        private String nome;
        private Nullable<int> nroFase;
        private Campeonato campeonato;
        private FaseCampeonato proximaFase;
        private IList<Rodada> rodadas;
        #endregion

        #region Construtores
        public FaseCampeonato()
        {

        }

        public FaseCampeonato(Nullable<long> id, String nome, Nullable<int> nroFase, Campeonato campeonato, FaseCampeonato proximaFase, IList<Rodada> rodadas)
        {
            this.id = id;
            this.nome = nome;
            this.nroFase = nroFase;
            this.campeonato = campeonato;
            this.proximaFase = proximaFase;
            this.rodadas = rodadas;
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

        public virtual String Nome
        {
            get
            {
                return this.nome;
            }

            set
            {
                this.nome = value;
            }
        }

        public virtual Nullable<int> NroFase
        {
            get
            {
                return this.nroFase.Value;
            }

            set
            {
                this.nroFase = value;
            }
        }
        
        public virtual FaseCampeonato ProximaFase
        {
            get
            {
                return this.proximaFase;
            }

            set
            {
                this.proximaFase = value;
            }
        }

        public virtual IList<Rodada> Rodadas
        {
            get
            {
                return this.rodadas;
            }

            set
            {
                this.rodadas = value;
            }
        }
        #endregion

        #region Classe Rica
        public override bool Equals(object obj)
        {
            if (obj is FaseCampeonato)
            {
                FaseCampeonato objeto = (FaseCampeonato)obj;

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
